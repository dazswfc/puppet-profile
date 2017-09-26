class profile::base(
  $ntp_servers = [
    '0.ubuntu.pool.ntp.org',
    '.ubuntu.pool.ntp.org',
  ],
) {
  include ::ssh
  class { '::ntp':
    servers => $ntp_servers,
  }
  
  if $facts['os']['family'] == 'RedHat' {
    include ::profile::selinux
  }
}
