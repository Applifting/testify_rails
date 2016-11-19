
class Testify::StatementNotFoundError < Testify::TestifyError
  def initialize(msg = nil, error_code = nil)
    msg ||= 'Statement was not found.'
    super(msg)
    error_code ||= 'NOT_FOUND'
    @code = error_code
  end
end