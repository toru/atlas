ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/spec'
require 'minitest/reporters'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class Minitest::Spec
  include FactoryGirl::Syntax::Methods

  before :each do
    DatabaseRewinder.clean_all
  end

  after :each do
    DatabaseRewinder.clean
  end
end

class ActionDispatch::IntegrationTest
  include FactoryGirl::Syntax::Methods
end
