# 2-puppet_custom_http_response_header.pp

# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Configure custom Nginx response header
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => "# Custom Nginx configuration\n
              server {\n
                  listen 80 default_server;\n
                  listen [::]:80 default_server;\n
                  add_header X-Served-By $::hostname;\n
                  root /var/www/html;\n
                  index index.html index.htm index.nginx-debian.html;\n
                  server_name _;\n
                  rewrite ^/redirect_me https://youtube.com permanent;\n
                  location / {\n
                      try_files \$uri \$uri/ =404;\n
                  }\n
                  error_page 404 /custom_404.html;\n
                  location = /custom_404.html {\n
                      root /usr/share/nginx/html;\n
                      internal;\n
                  }\n
              }",
}

# Restart Nginx service
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => File['/etc/nginx/sites-available/default'],
}
