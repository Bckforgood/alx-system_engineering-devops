# Changes the limitations on the holberton user
class profile::holberton {
  exec { 'change-os-configuration-for-holberton-user':
    command => 'ulimit -n 8192',
    user    => 'holberton',
  }
}
