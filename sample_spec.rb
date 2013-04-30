our_watcher = ScoreButt.new

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
