class apt::unattended-upgrade::automatic ($ensure = present) {

  class {
    "apt::unattended-upgrade":
      ensure => $ensure;
  }

  apt::conf{"99unattended-upgrade":
    ensure  => $ensure,
    content => "APT::Periodic::Unattended-Upgrade \"1\";\n",
  }

  case $lsbdistid {
    'Debian': {
      apt::conf{'50unattended-upgrades':
        ensure  => $ensure,
        content => template("apt/unattended-upgrades.${lsbdistcodename}.erb"),
      }
    }
    'Ubuntu': {
      apt::conf{'50unattended-upgrades':
        ensure  => $ensure,
        content => template("apt/unattended-upgrades.${lsbdistid}.erb"),
      }
    }
  }

}
