require 'database_cleaner'

class Testify::Case

  include FactoryGirl::Syntax::Methods

  def start_case
    cleanup_db
    start
  end

  def end_case

  end

  def execute_statement(name)
    if self.respond_to?(name)
      return self.send(name)
    end
    raise  Testify::StatementNotFoundError.new
  end

  def start

  end


  def end

  end


  def self.cases
    Dir[Rails.root.join('testify/*.rb')].each {|file| require file }
    return Testify::Case.descendants.index_by{|test_case|
      test_case.name
    }
  end

  def self.find_case(name)
    test_case = self.cases[name]
    raise Testify::CaseNotFoundError.new if test_case.nil?
    test_case.new
  end

  private

  def cleanup_db
    ::DatabaseCleaner.strategy = :truncation
    ::DatabaseCleaner.clean
  end

end