# sets up an ssh configuration file

file { '/etc/ssh/sshd_config':
    ensure  => file,
    owner   => 'root',
    content => 'IdentityFile ~/.ssh/school
PasswordAuthentication no',
}
