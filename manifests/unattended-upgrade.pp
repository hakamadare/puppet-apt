class apt::unattended-upgrade ($ensure = present) {
  package {"unattended-upgrades":
    ensure => $ensure,
  }
}
