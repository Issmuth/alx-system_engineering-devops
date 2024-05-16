# holberton access

exec {'replace-1':
  provider => shell,
  command  => 'sudo sed -i "s/nofile 5/nofile 50000/" /etc/security/limits.conf; sudo sed -i "s/nofile 4/nofile 40000/" /etc/security/limits.conf',
}
