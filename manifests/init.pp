# == Class: registry 
#
define notify_keys($key, $value) {

    notify { "currently looping server hostname $key": }

  registry_key { $key:
    ensure => present,
    }

  registry_value { $key:
    ensure => present,
    data   => $value,
    }
  }

class registry {
  $keys = hiera("keys")
    create_resources( notify_keys, $keys )
}
