require 'test_setup'
require 'test_helpers'

class ControllerTest < Test::Unit::TestCase
  LOG = Log::classlog(self)



  #LOG = Log.new("Class: #{self.name}") # Creates a log named 'Class:' + class name + .log
  #LOG.debug "Loaded class '#{self.name}' from '#{__FILE__}'"
  #LOG.debug "Creating '#{self.to_s}'" # Use inside def initialize, to get object id

  include Test_helpers # Provides cleanup_and_setup_workflow_dirs
  
  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    LOG.init(self)
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  context "Controller - " do
    setup do
      require 'controller'
    end
    
    should "Initialize." do
      assert_nothing_raised { Controller.new }  
    end

    context "Controller object - " do
      setup do
        @c = Controller.new
      end

      should "Call awakeFromNib." do
        assert_nothing_raised { @c.awakeFromNib }        
      end


    end
  end
end