require 'httpclient'
module Scorebutt
  class HostWatcher
    attr_accessor :ip, :blocks
    def initialize(attributes)
      self.ip = attributes[:ip]
      self.ip = "http://google.com"
      self.blocks = []
    end

    def process(&block)
      instance_eval(&block)
      self.blocks
    end

    def http
      self.blocks << lambda do
        proxy = ENV['HTTP_PROXY']
        client = HTTPClient.new(proxy)
        target = self.ip
        puts "requesting #{target}"
        puts client.get_content(target)
      end
    end

    def https
    end

    def smtp
    end

    def ftp
    end

    def telnet
    end

    def ssh
    end

    def ntp
    end

    def bonjour
    end
  end
end
