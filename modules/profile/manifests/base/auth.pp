# base auth configuration
class profile::base::auth {
  class { 'authselect': policy => 'minimal' }
}
