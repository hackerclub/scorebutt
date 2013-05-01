require 'httpclient'
module Scorebutt
  class HostWatcher
    attr_accessor :ip, :blocks
    def initialize(attributes)
      self.ip = attributes[:ip]
      self.blocks = []
    end

    def process(&block)
      instance_eval(&block)
    end

    def http
      proxy = ENV['HTTP_PROXY']
      client = HTTPClient.new(proxy)
      target = self.ip
      puts clnt.get_content(target)
    end

    def https
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
