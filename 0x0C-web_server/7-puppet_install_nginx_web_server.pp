#!/usr/bin/env pup
# confiures nginx

package { 'nginx':
    ensure => installed,
    'http' => {
        'sendfile' => 'on',
        'server'   => {
            'listen'     => '80',
            'location /' => {
                'return'      => '200',
                'add_header'  => 'Content-Type text/html',
                'return_body' => 'Hello World!',
            },
        },
    },
}
