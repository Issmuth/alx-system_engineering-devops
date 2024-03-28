#!/usr/bin/env pup
# confiures nginx

package { 'nginx':
    ensure => installed,
}

service { 'nginx':
    ensure  => running,
    enable  => true,
    require => Package['nginx'],
}

file { '/etc/nginx/sites-available/default':
    ensure  => file,
    content => template('nginx/default.erb'),
    notify  => Service['nginx'],
}

server {
  listen 80 default_server;
  listen [::]:80 default_server;

  location / {
    return 200 'Hello World!';
    add_header Content-Type text/html;
  }

  location /redirect_me {
    return 301 'https://www.youtube.com/watch?v=xvFZjo5PgG0&pp=ygUJcmljayByb2xs';
  }
}
