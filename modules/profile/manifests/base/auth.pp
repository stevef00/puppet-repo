# base auth configuration
class profile::base::auth {

  $pam_ssh_agent_auth_package = $::os[family] ? {
    'Debian' => 'libpam-ssh-agent-auth',
    'RedHat' => 'pam_ssh_agent_auth',
    default  => fail("${::os[family]} is not supported"),
  }

  file { '/etc/sudoers.d/ssh_auth_sock':
    owner   => root,
    group   => root,
    mode    => '0600',
    content => "Defaults env_keep += SSH_AUTH_SOCK\n"
  }
  -> package { 'pam_ssh_agent_auth':
    ensure => installed,
    name   => $pam_ssh_agent_auth_package,
  }

  if $::os[family] == 'RedHat' {
    class { 'authselect': policy => 'custom/local' }
    authselect::feature { 'with-pam_ssh_agent_auth':
      enable  => true,
      require => Package['pam_ssh_agent_auth']
    }
  } elsif $::os[family] == 'Debian' {
    # FIXME: we should abstract this some way. Does debian have something like authselect policies?
    #        or at least, we can try making some pam module that abstracts these sort of changes.
    $pam_ssh_agent_auth_line = 'auth sufficient pam_ssh_agent_auth.so file=~/.ssh/authorized_keys'
    exec { 'pam_ssh_agent_auth':
      command => "sed -i '/^@include *common-auth/i ${pam_ssh_agent_auth_line}' /etc/pam.d/sudo",
      unless  => "grep '${pam_ssh_agent_auth_line}' /etc/pam.d/sudo",
      path    => [ '/bin', '/usr/bin' ],
      require => Package['pam_ssh_agent_auth'];
    }
  } else {
    fail("${::os[family]} is not supported")
  }

}
