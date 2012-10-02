# == Class: glances
#
# Full description of class glances here.
#
# === Parameters
#
# None
#
# === Variables
#
# None
#
# === Examples
#
# node server.example.com {
#   include glances
# }
#
# === Authors
#
# Remi Verchere <rverchere@gmail.com>
#
# === Copyright
#
# Copyright (c) 2012 Remi Verchere
#
class glances {

  case $operatingsystem {

  debian, ubuntu: {
      package { ['python-pip', 'build-essential', 'python-dev']:
        ensure => installed,
      }
      exec { 'pip-glances':
        command => 'pip install glances',
        creates => '/usr/local/bin/glances',
        require => Package['python-pip'],
      }
    }

  default: {
      fail("module ${module_name} is not supported on ${operatingsystem}")
    }
  }

}