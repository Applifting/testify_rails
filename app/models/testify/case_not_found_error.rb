
class Testify::CaseNotFoundError < Testify::TestifyError
  def initialize(msg = nil, error_code = nil)
    msg ||= 'Test case was not found.'
    super(msg)
    error_code ||= 'NOT_FOUND'
    @code = error_code
  end
end