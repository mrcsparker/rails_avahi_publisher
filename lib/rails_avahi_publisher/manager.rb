module RailsAvahiPublisher
  class Manager

    attr_accessor :dbus
    attr_accessor :server
    attr_accessor :entry_group

    def initialize
      setup_dbus
      setup_avahi
      setup_server
      setup_entry_group
    end

    def publish(name = "Ruby Web Server", port = 8080, path = "")

      full_path = []
      full_path = [ path.unpack("C*") ] if path != ""

      @entry_group.AddService(-1, -1, 0,
                              name, 
                              "_http._tcp",
                              @server.GetDomainName()[0],
                              @server.GetHostNameFqdn()[0],
                              port,
                              full_path)
      @entry_group.Commit()
    end

    def published?
      path = @server.ServiceBrowserNew(-1, -1, "_http._tcp", @server.GetDomainName()[0], 0)[0]

      browser = @avahi.object(path)

      browser.default_iface = 'org.freedesktop.Avahi.ServiceBrowser'
      browser.introspect

      matchrule = DBus::MatchRule.new()
      matchrule.interface = 'org.freedesktop.Avahi.ServiceBrowser'
      matchrule.member = 'ItemNew'
      matchrule.type = 'signal'

      @dbus.add_match(matchrule) do |m|
        p m.params
      end

    end

    private

    def setup_dbus
      @dbus = DBus::SystemBus.instance
    end

    def setup_avahi
      @avahi = @dbus.service('org.freedesktop.Avahi')
    end

    def setup_server
      @server = @avahi.object('/')
      @server.introspect
      @server.default_iface = 'org.freedesktop.Avahi.Server'
    end

    def setup_entry_group
      entry_path = @server.EntryGroupNew()[0]
      @entry_group = @avahi.object(entry_path)
      @entry_group.introspect
      @entry_group.default_iface = 'org.freedesktop.Avahi.EntryGroup'
    end
  end
end
