# Base Directory shortcut
$basedir = '/var/lib/apt/repo'

package { 's3cmd':
  ensure   => present,
}

# Main reprepro class
class { 'reprepro':
  basedir => $basedir,
}

# Set up a repository
reprepro::repository { 'localpkgs':
  ensure  => present,
  basedir => $basedir,
  options => ['basedir .'],
}

# Create a distribution within that repository
reprepro::distribution { 'precise':
  basedir       => $basedir,
  repository    => 'localpkgs',
  origin        => 'Foo',
  label         => 'Bar',
  suite         => 'precise',
  architectures => 'amd64 i386',
  components    => 'main contrib non-free',
  description   => 'Package repository for flapjack',
  sign_with     => 'F4D5DAA8',
  not_automatic => 'No',
}

# Set up apache
#class { 'apache': }

# Make your repo publicly accessible
#apache::vhost { 'localpkgs':
#  port       => '80',
#  docroot    => '/var/lib/apt/repo/localpkgs',
#  servername => 'apt.example.com',
#  require    => Reprepro::Distribution['precise'],
#}
#
# Ensure your public key is accessible to download
#file { '/var/lib/apt/repo/localpkgs/localpkgs.gpg':
#  ensure  => present,
#  owner   => 'www-data',
#  group   => 'reprepro',
#  mode    => '0644',
#  source  => 'puppet:///modules/reprepro/localpkgs.gpg',
#  require => Apache::Vhost['localpkgs'],
#}

# Set up an apt repo
#apt::source { 'localpkgs':
#  location    => 'http://packages.flapjack.io/deb',
#  release     => 'precise',
#  repos       => 'main contrib non-free',
#  key         => 'F4D5DAA8',
#  key_source  => 'http://packages.flapjack.io/deb/localpkgs.gpg',
#  require     => File['/var/lib/apt/repo/localpkgs/localpkgs.gpg'],
#  include_src => false,
#}

