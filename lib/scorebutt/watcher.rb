module Scorebutt
  class Watcher 

    def initialize(&block)
      @hosts = []
      @host_blocks = []
    end

    def get_blocks
      @host_blocks
    end

    def host(ip, &block)
      puts "ip: #{ip}, block: #{&block}"
    end
    def watch
      puts "watching!"
    end

  end
end
