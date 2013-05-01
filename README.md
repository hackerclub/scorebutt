# Scorebutt

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'scorebutt'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install scorebutt

## Usage

1. Install the gem (`gem install scorebutt`)
2. Require it (`require 'scorebutt'`)
3. Create a Scorer object (`Scorebutt::Scorer.new(sleep_time: 10)`)
4. Call `.watch` on the object passing it a block of things to watch.

Example:

		require 'scorebutt'
		our_watcher = Scorebutt::Scorer.new(sleep_time: 10) # In seconds
		
		our_watcher.watch do
		  host '192.168.1.5' do
		    http
		    smtp
		    ftp
		    telnet
		    ssh
		  end
		end
		
A sample spec is available [here](https://github.com/tesc-ccdc/scorebutt/blob/master/sample_spec.rb)

Just run the spec with ruby and it'll watch and report back any up/down services!

####Currently, Scorebutt supports: (please add to this list!)
- http


## Contributing

1. Fork it
2. Commit your changes (`git commit -am 'Add some feature'`)
3. Push to the forked repo (`git push origin master`)
4. Create new Pull Request
