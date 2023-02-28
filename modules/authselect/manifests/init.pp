# set and manage authselect policy
class authselect ($policy='minimal') {

  file { "/etc/authselect/${policy}":
    ensure  => directory,
    source  => "puppet:///modules/authselect/${policy}",
    recurse => true,
    purge   => true,
    force   => true,
  }
  -> exec { 'authselect_policy':
    command => "authselect select ${policy}",
    unless  => "authselect current | grep -q \"^Profile ID: ${policy}\$\" 2>/dev/null",
    path    => [ '/bin', '/sbin', '/usr/bin', '/usr/sbin' ];
  }

}
