# sets up a new server

exec { 'install nginx':
    provider => shell,
    command  => 'sudo apt-get -y update; sudo apt-get install nginx;',
}

exec { 'serve port 80':
    provider => shell,
    command  => 'sudo ufw allow "Nginx HTTP"; "Hello World!" > /var/www/html/index.nginx-debian.html',
}

# adds a redirect config to nginx

$commands = ['line1="\t}\n\tif (\$uri ~* \"redirect_me\") {\""',
              'line2="\t\trewrite ^ https://www.youtube.com/watch?v=xvFZjo5PgG0&pp=ygUJcmljayByb2xs permanent;"',
              'temp=$(mktemp)',
              'echo -e "$line1" >> "$temp"',
              'echo -e "$line2" >> "$temp"',
              'sudo sed -i "\/^\\t\\ttry_files \$uri \$uri\/ \=404\;/r $temp" /etc/nginx/sites-available/default',
            ]
$commands_merged = join($commands, '; ')

exec { 'adds redirect':
    provider => shell,
    command  => $commands_merged,
    }

# creates and adds a custom error page to nginx
$commands2 = ['err_line1="\n\t}\n\terror_page 404 /error.html;"',
              'err_line2="\tlocation = /error.html {"',
              'err_line3="\t\tinternal;\n\t"',
              'errtemp=$(mktemp)',
              'echo -e "$err_line1" >> "$errtemp"',
              'echo -e "$err_line2" >> "$errtemp"',
              'echo -e "$err_line3" >> "$errtemp"',
              'sudo sed -i "\/^\\t\\ttry_files \$uri \$uri\/ \=404\;/r $errtemp" /etc/nginx/sites-available/default',
              "sudo echo 'Ceci n\'est pas une page' > error.html",
              'sudo mv error.html /var/www/html'
              ]

$commands_merged2 = join($commands2, '; ')

exec { 'creates error pages':
    provider => shell,
    command  => $commands_merged2,
}

$headers = ['sed -i "s/include \/etc\/nginx\/sites-enabled\/\*;',
            '/include \/etc\/nginx\/sites-enabled\/\*;\n\tadd_header',
            ' X-Served-By \"$HOSTNAME\";/" /etc/nginx/nginx.conf'
          ]

$header_merged = join($headers, '')

exec { 'add header':
    provider => shell,
    command  => $header_merged,
}

exec { 'start nginx':
    provider => shell,
    command  => 'sudo service ngnix restart',
}
