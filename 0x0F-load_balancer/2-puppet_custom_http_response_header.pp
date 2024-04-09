$nginx_package_name = 'nginx'
$ufw_package_name = 'ufw'

package { 'nginx':
  ensure => installed,
}

package { 'ufw':
  ensure => installed,
}

exec { 'ufw_allow_nginx_http':
  command => "ufw allow 'Nginx HTTP'",
  require => Package[$ufw_package_name],
}

file { '/var/www/html/index.nginx-debian.html':
  ensure  => file,
  content => 'Hello World!',
  require => Package[$nginx_package_name],
}

file_line { 'nginx_redirect':
  path    => '/etc/nginx/sites-enabled/default',
  line    => '\t}\n\tif ($uri ~* "redirect_me") {\n\t\trewrite ^ https://www.youtube.com/watch?v=xvFZjo5PgG0&pp=ygUJcmljayByb2xs permanent;',
  require => Package[$nginx_package_name],
}

file { '/var/www/html/error.html':
  ensure  => file,
  content => 'Ceci n\'est pas une page',
  require => Package[$nginx_package_name],
}

file_line { 'nginx_error_page':
  path    => '/etc/nginx/sites-enabled/default',
  line    => '\n\t}\n\terror_page 404 /error.html;\n\tlocation = /error.html {\n\t\tinternal;',
  require => Package[$nginx_package_name],
}

