#create a file in /tmp.

exec { 'killmenow':
  command     => 'pkill -f killmenow',
  refreshonly => true,
}
