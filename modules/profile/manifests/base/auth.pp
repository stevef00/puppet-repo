# base auth configuration
class profile::base::auth {
  class { 'authselect': policy => 'custom/local' }

  file { '/etc/sudoers.d/ssh_auth_sock':
    owner   => root,
    group   => root,
    mode    => '0600',
    content => "Defaults env_keep += SSH_AUTH_SOCK\n"
  }
  -> package { 'pam_ssh_agent_auth': ensure => installed }
  -> authselect::feature { 'with-pam_ssh_agent_auth': enable => true }

}
