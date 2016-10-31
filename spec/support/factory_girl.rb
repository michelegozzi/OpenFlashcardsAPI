RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  
  # config.before(:suite) do
    # #DatabaseCleaner.strategy = :transaction
    # #DatabaseCleaner.clean_with(:truncation)

    # # # begin
      # # DatabaseCleaner.start
      # # FactoryGirl.lint
    # # ensure
      # # DatabaseCleaner.clean
    # # end
  # end
  
  config.before(:suite) do
    
    #DatabaseCleaner.clean_with(:truncation)
    
  end

  config.before(:each) do
    #DatabaseCleaner.strategy = :truncation
    #DatabaseCleaner.start
    
  end

  config.after(:each) do
    #DatabaseCleaner.clean
    pp "PURGE"
    Mongoid.purge!
  end
end