# sets up an ssh configuration file

file_line { 'use school':
    ensure  => present,
    path    => '/etc/ssh/ssh_config',
    replace => true,
    line    => 'IdentityFile ~/.ssh/school',
}

file_line { 'no pasword':
    ensure  => present,
    path    => '/etc/ssh/ssh_config',
    replace => true,
    line    => 'PasswordAuthentication no',
}
