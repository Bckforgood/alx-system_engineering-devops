define nginx_config_fix {
  $ulimit_value = $title
exec { "fix--for-nginx-${ulimit_value}":
    command => "/bin/bash -c \"sed -iE 's/^ULIMIT=.*/ULIMIT=\\\"-n ${ulimit_value}\\\"/' /etc/default/nginx && service nginx restart\"",
    path    => ['/usr/bin', '/usr/sbin', '/bin'],
 }
}

nginx_config_fix { '8192': }
