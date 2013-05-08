require "scorebutt/version"
require "scorebutt/watcher"
require "scorebutt/host_watcher"

module Scorebutt
  class Scorer
    
    # TODO collect stats for each service on each host
    # TODO save data to log file

    attr_accessor :sleep_time

    def initialize(attributes)
      self.sleep_time = attributes[:sleep_time]
      self.sleep_time ||= 10
    end

    def watch(&block)
      watchees = Scorebutt::Watcher.new(&block)
      # Watcher.new should return an array of procs that test each service for a given host
      watcher_blocks = watchees.get_blocks.flatten!
      puts "Got #{watcher_blocks.size} blocks"

      start_time = Time.now
      counter=0 and loop do
        puts "\n #{Time.now.strftime("%k:%M:%S")} ------------------------------------------------------------------------\n"
        counter+=1
        watchees.get_blocks.each do |watcher|
          # Watcher is a proc, so run it
          puts watcher.call
        end
        sleep self.sleep_time
      end
    
    rescue SystemExit, Interrupt  # From SIGINT
      puts "\nInterrupt signal recieved"
    
    ensure  # Print some stats on program exit
      end_time = Time.now
      puts
      puts "#{counter} checks made in #{(end_time - start_time).to_i} seconds"
      puts start_time.strftime("  Start at %k:%M:%S, %m/%d/%Y")
      puts end_time.strftime("  Ended at %k:%M:%S, %m/%d/%Y")
    end

  end
end
