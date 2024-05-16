# holberton access

$command1 = 'sudo sed -i "s/nofile 5/nofile 50000/" /etc/security/limits.conf;'
$command2 = ' sudo sed -i "s/nofile 4/nofile 40000/" /etc/security/limits.conf'
$complete = "${command1}${command2}"
exec {'replace-1':
  provider => shell,
  command  => " ${complete}",
}
