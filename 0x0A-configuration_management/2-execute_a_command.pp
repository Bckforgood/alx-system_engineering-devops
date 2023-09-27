# Filename: kill_process.pp

exec { 'killmenow':
  command     => 'pkill killmenow',
  path        => '/bin:/usr/bin',
  logoutput   => true,
  refreshonly => true,
}
