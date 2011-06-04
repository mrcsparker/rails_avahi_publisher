require 'rails_avahi_publisher'

describe RailsAvahiPublisher::Publisher do
  before(:each) do
    @publisher = RailsAvahiPublisher::Publisher.new
  end

  it "should have a manager" do
    @publisher.manager.should_not be_nil
  end

  it "should create a daemon" do
    @publisher.start

    @publisher.avahi_task.should_not be_nil

    begin
      trap("SIGTERM"){ exit! 0 }
      @publisher.stop
    rescue

    end

  end
end
