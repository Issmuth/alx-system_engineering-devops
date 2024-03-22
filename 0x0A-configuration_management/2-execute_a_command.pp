#!/usr/bin/pup
# kills a specific process

exec { 'kill':
    command => 'pkill -f killmenow',
    path    => ['/usr/bin', '/usr/sbin', '/bin'],
}
