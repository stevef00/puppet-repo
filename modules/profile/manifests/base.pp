# this class will be included by all nodes and should represent the
# minimal required configuration
class profile::base {
  include profile::base::auth
  include profile::base::packages
  include profile::base::users
  include profile::puppet::agent
}
