
class Testify::CasesController < Testify::ApplicationController


  before_action :bind_case


  def create
    result = @case.start_case
    render json: result, status: 200
  end

  def statements
    result = @case.execute_statement(params[:statement_id])
    render json: result, status: 200
  end

  def destroy
    result = @case.end_case
    render json: result, status: 200
  end


  private

  def bind_case
    @case = Testify::Case.find_case(params[:id])
  end



  rescue_from Testify::CaseNotFoundError do |exception|
    render json: json_from_error(exception), status: 404
  end

  rescue_from Testify::StatementNotFoundError do |exception|
    render json: json_from_error(exception), status: 404
  end

  def json_from_error(error,additional_info=nil)
    code = ""
    if error.respond_to? :code
      code = error.code
    else
      code = error.class.to_s
    end
    hash = { code: code, message: error.message }
    hash.merge!(additional_info) unless additional_info.nil?
    hash
  end

end