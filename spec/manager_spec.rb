require 'rails_avahi_publisher'

describe RailsAvahiPublisher::Manager do

  before(:each) do
    @manager = RailsAvahiPublisher::Manager.new
  end

  it "should have an accessible dbus attribute" do
    @manager.dbus.should_not be_nil
  end

  it "should create a valid server iface" do
    @manager.server.default_iface.should == 'org.freedesktop.Avahi.Server'
  end

  it "should create an entry_group" do
    @manager.entry_group.should_not be_nil
  end

  it "should have an entry group path" do
    @manager.entry_group.path.should_not be_nil
  end

  it "should be introspected" do
    @manager.entry_group.introspected.should == true
  end

  it "should have the correct iface" do
    @manager.entry_group.default_iface.should == 'org.freedesktop.Avahi.EntryGroup'
  end

  describe "#publish" do
    it "should have a default name" do
      @manager.publish
    end
  end

end
