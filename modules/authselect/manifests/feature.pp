# enable or disable an authselect policy feature
#
# authselect::feature { 'with-pam_ssh_agent_auth': enable => true }
#
# $name      feature
# $enable    true/false
#
define authselect::feature ($enable=true) {
  include authselect

  $feature = $name

  validate_bool($enable)

  if $enable {
    exec { "enable_${feature}":
      command => "authselect enable-feature ${feature} >/dev/null 2>&1",
      unless  => "grep -q \"^${feature}\" /etc/authselect/authselect.conf 2>/dev/null",
      path    => [ '/bin', '/sbin', '/usr/bin', '/usr/sbin' ],
      require => Exec['authselect_policy'],
    }
  } else {
    exec { "disable_${feature}":
      command => "authselect disable-feature ${feature} >/dev/null 2>&1",
      onlyif  => "grep -q \"^${feature}\" /etc/authselect/authselect.conf 2>/dev/null",
      path    => [ '/bin', '/sbin', '/usr/bin', '/usr/sbin' ],
      require => Exec['authselect_policy'],
    }
  }

}
