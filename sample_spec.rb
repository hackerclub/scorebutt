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
  host '192.168.2.5' do
    https
    ntp
    ssh
    bonjour
  end
end
