# configure the puppetagent class
class profile::puppet::agent {

  $puppet_agent_version = $::os[family] ? {
    'Debian' => '7.23.0-1focal',
    'Redhat' => '7.23.0-1.el8',
    default  => fail("${::os[family]} not supported"),
  }

  class { 'puppetagent':
    agent_version     => $puppet_agent_version,
    agent_server      => 'puppet.example.com',
    agent_environment => 'production',
    agent_runinterval => 300,
  }

}
