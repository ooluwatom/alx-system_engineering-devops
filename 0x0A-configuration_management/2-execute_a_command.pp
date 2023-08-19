# Killing a process by creating a manifest with puppet
exec { 'pkill':
  command  => 'pkill killmenow',
  provider => shell,
}
