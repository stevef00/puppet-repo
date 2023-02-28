# base auth configuration
class profile::base::auth {
  class { 'authselect': policy => 'custom/local' }
}
