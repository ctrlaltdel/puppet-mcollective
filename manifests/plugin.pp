# Definition: mcollective::plugin
#
# Sets up an MCollective plugin using packages.
#
# Parameters:
#   ['ensure']         - Whether the plugin should be present or absent.
#
# Actions:
# - Installs an MCollective plugin using packages.
#
# Sample Usage:
#   mcollective::plugin { 'puppetca':
#     ensure         => present,
#   }
#
define mcollective::plugin (
  $ensure='present'
) {

  $package = $::operatingsystem ? {
    /Debian|Ubuntu/ => "mcollective-agent-${name}",
    /RedHat|CentOS/ => "mcollective-plugins-${name}",
  }

  package { $package:
    ensure => $ensure,
    notify => Exec['reload mcollective'],
  }
}
