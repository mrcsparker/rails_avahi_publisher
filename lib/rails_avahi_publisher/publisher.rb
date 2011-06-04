module RailsAvahiPublisher
  class Publisher

    attr_accessor :manager
    attr_accessor :avahi_task

    def initialize
      @manager = RailsAvahiPublisher::Manager.new
      @manager.publish
    end

    def start
      @avahi_task = Daemons.call do
        main = DBus::Main.new
        main << @manager.dbus
        main.run
      end
    end

    def stop
      @avahi_task.stop
    end

  end
end

