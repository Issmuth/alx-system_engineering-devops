#!/usr/bin/env pup
# confiures nginx

package { 'nginx':
    ensure         => installed,
    service_manage => true,
    nginx_configs  => {
        'http'         => {
            'sendfile' => 'on',
            'server'   => {
                'listen'                => '80',
                'location /'            => {
                    'return'      => '200',
                    'add_header'  => 'Content-Type text/html',
                    'return_body' => 'Hello World!',
                },
                'location /redirect_me' => {
                    'return'     => '301',
                    'add_header' => 'Location https://www.youtube.com/watch?v=xvFZjo5PgG0&pp=ygUJcmljayByb2xs',
                },
            },
        },
    },
}
