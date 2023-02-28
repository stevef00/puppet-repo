# base auth configuration
class profile::base::auth {
  class { 'authselect': policy => 'custom/local' }

  package { 'pam_ssh_agent_auth': ensure => installed }
  -> authselect::feature { 'with-pam_ssh_agent_auth': enable => true }
}
