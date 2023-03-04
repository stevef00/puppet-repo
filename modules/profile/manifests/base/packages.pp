# packages to install on all systems
class profile::base::packages {
  $packages = [
    'git-core',
    'mlocate',
  ]
  package { $packages: ensure => installed }
}
