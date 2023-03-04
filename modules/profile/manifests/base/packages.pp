# packages to install on all systems
class profile::base::packages {
  $packages = [
    $::os[family] ? {
      'Debian' => 'git',
      'RedHat' => 'git-core',
    },
    'mlocate',
  ]
  package { $packages: ensure => installed }
}
