# base docker profile
class profile::docker {

  $yum_server = 'http://gw.example.com:8080'
  $docker_gid = 991

  $use_upstream_package_source = $::os[family] ? {
    'Debian' => true,
    'RedHat' => false,
    default  => fail("${::os[family]} is not supported"),
  }

  if $::os[family] == 'RedHat' {
    yumrepo {
      'docker':
        ensure   => present,
        name     => 'docker',
        descr    => 'docker',
        baseurl  => "${yum_server}/docker/el/${::os[release][major]}/\$basearch/",
        enabled  => 1,
        gpgcheck => 0,
        before   => Class[docker],
    }
  }

  class { 'docker':
    use_upstream_package_source => $use_upstream_package_source,
  }
}
