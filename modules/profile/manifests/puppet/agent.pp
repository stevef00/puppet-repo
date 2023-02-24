# configure the puppetagent class
class profile::puppet::agent {

  class { 'puppetagent':
    agent_version     => '7.23.0-1.el8',
    agent_server      => 'puppet.example.com',
    agent_environment => 'production',
    agent_runinterval => 300,
  }

}
