# sets up an ssh configuration file

package { 'openssh-server':
    ensure => installed,
}

file { '/etc/ssh/sshd_config':
    ensure  => file,
    owner   => 'root',
    content => 'IdentityFile ~/.ssh/school
                PasswordAuthentication no',
}
