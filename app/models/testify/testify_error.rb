# Basic error class of Knowspread system
class Testify::TestifyError < StandardError
  ERROR_CODE = 'ERROR'

  def initialize(message, code = nil)
    super(message)
    @code = code || self.class::ERROR_CODE
  end

  attr_accessor :code


  def as_json
    { code: @code, message: message }
  end

end
