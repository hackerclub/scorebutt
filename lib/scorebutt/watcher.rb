module Scorebutt
  class Watcher 

    def initialize(&block)
      @hosts = []
      @host_blocks = []

      instance_eval(&block)
    end

    def get_blocks
      @host_blocks
    end

    def host(ip, &block)
      puts "ip: #{ip}, block: #{block}"
      host = Scorebutt::HostWatcher.new(ip: ip)
      host.process(&block)
    end

    def watch
      puts "watching!"
    end

  end
end
