exec { 'install nginx':
    command => '/bin/bash -c "apt-get update && apt-get install nginx"'
}

exec { 'listen http':
    provider => shell,
    command  => 'ufw allow "Nginx HTTP"',
}

exec { 'hello world':
    command => '/bin/bash -c "echo \"Hello World!\" > /var/www/html/index.nginx-debian.html"',
}

exec { 'add redirect':
    provider => shell,
    command  => 'line1="\n\t}\n\tif (\$uri ~* \"redirect_me\") {"; line2="\t\trewrite ^ https://www.youtube.com/watch?v=xvFZjo5PgG0&pp=ygUJcmljayByb2xs permanent;"; temp=$(mktemp); echo -e "$line1" >> "$temp"; echo -e "$line2" >> "$temp"; sudo sed -i "\/^\\t\\ttry_files \$uri \$uri\/ \=404\;/r $temp" /etc/nginx/sites-available/default;',
}

exec { 'custom_error_page':
    provider => shell,
    command  => 'echo "Ceci n\'est pas une page" > error.html',
}

exec { 'error page config':
    provider => shell,
    command  => 'sudo mv error.html /var/www/html; err_line1="\n\t}\n\terror_page 404 /error.html;"',
}

exec { 'error page config 2':
    provider => shell,
    command  => 'err_line2="\tlocation = /error.html {"; err_line3="\t\tinternal;\n\t"',
}

exec { 'error page config 3':
    provider => shell,
    command  => 'errtemp=$(mktemp); echo -e "$err_line1" >> "$errtemp"',
}

exec { 'error page config 4':
    provider => shell,
    command  => 'echo -e "$err_line2" >> "$errtemp"',
}

exec { 'error page config 5':
    provider => shell,
    command  => 'echo -e "$err_line3" >> "$errtemp"',
}

exec { 'error page config 6':
    provider => shell,
    command  => 'sudo sed -i "\/^\\t\\ttry_files \$uri \$uri\/ \=404\;/r $errtemp" /etc/nginx/sites-available/default',
}

exec {'restart nginx':
    provider => shell
    command  => 'service nginx restart'
}
