require 'httpclient'
require 'colored'
module Scorebutt
  class HostWatcher
    attr_accessor :ip, :blocks
    def initialize(attributes)
      self.ip = attributes[:ip]
      self.blocks = []
    end

    def process(&block)
      instance_eval(&block)
      self.blocks
    end

    def http
      # We need to check that http://self.ip works and report any errors or that it's OK
      #
      # Make sure to use begin->rescue->end to catch runtime errors so one broken method doesn't make it crash
      self.blocks << lambda do
        ok_status_codes = [
          200, 201, 202, 203, 204, 205, 206, 207
        ]

        proxy = ENV['HTTP_PROXY']
        client = HTTPClient.new(proxy)
        target = "http://" + self.ip
        begin
          result = client.get(target)
          if ok_status_codes.include? result.header.status_code
            puts "#{self.ip}: OK".green
          else
            puts "#{self.ip}: UNKNOWN, Status Code: ".yellow + result.header.status_code.to_s
          end
        rescue Exception => detail
          # An actual error occurred. Report it, don't die on me!
          puts "#{self.ip}: ERROR ".red + detail.to_s
        end
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
