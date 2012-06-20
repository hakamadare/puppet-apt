class apt::unattended-upgrade::automatic (
  $ensure = present,
  $baserepos = $apt::params::baserepos,
  $extrarepos = undef
) {

  class {
    "apt::unattended-upgrade":
      ensure => $ensure;
  }

  apt::conf{
    "50unattended-upgrades":
      ensure  => $ensure,
      content => template("apt/unattended-upgrades.erb");
    "99unattended-upgrade":
      ensure  => $ensure,
      content => "APT::Periodic::Unattended-Upgrade \"1\";\n";
  }
}
