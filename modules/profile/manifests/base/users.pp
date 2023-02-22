# define the base set of users that should be present on all nodes
class profile::base::users {

  user {
    'steve':
      ensure         => present,
      comment        => 'Steve Feehan',
      uid            => 1000,
      gid            => 1000,
      home           => '/home/steve',
      managehome     => true,
      shell          => '/bin/bash',
      purge_ssh_keys => true,
  }

  ssh_authorized_key {
    'steve@home':
      ensure => present,
      user   => 'steve',
      type   => 'ssh-rsa',
      key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABgQDqghJZYFJDhLc+fTJJXtBNQLSo4HKEfsNGoc2p03ea6yZYlurhlbArmKsYD/Da+1zj1mHdQB7am4ucTBwYIg2alKIIA9zAHu2fQJfiSwkoY5UgroxB/AkRjTr2u2/I8iN0km4i/yB5r3f3fwuJB9ZJd5VlWOEMhaRx4PI6PO9EVVt2u09ZdJrDrFKHgHHlQg819AM7cnQZyZV46TlJE6uOlybpyXF7ZRRFDZMoU0IBTUrmynzIXp8FqhZSnzRgWQk1RfO3GDb9Tm7lRhlYuGZF+2WmaigtHtd1cBvX6QN49oU6Qk/SfDHSbna7z6jpBL2Y3VRFuLYnNBjMdiqCs5OfpGJMT48IZXso3JZhTRQN85rXEtJNR84aXHHrHgu400S9TrcAT9BWurwbEIjAF20JN1hYwmoANe5lryY+dA6fTh+94/0A9Vh3NnUrRCMwAFtQGTmShAWXkYgMSWIoZeiz8YxfX/N2AYBwrPPWaNceBzuhH7ED91dB1jmM/fs2JcM='
  }

}
