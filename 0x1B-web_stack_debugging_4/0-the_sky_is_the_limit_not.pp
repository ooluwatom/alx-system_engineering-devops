# Began by changing nginx open file limit
exec { 'Change the  nginx limit':
  command  => 'sudo sed -i "s/15/4096/g" /etc/default/nginx; sudo service nginx restart',
  provider => shell,
}