
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Wrap git command-line interface without blocking",
  "dist_author" => [
    "Graham Ollis <plicease\@cpan.org>"
  ],
  "dist_name" => "AnyEvent-Git-Wrapper",
  "dist_version" => "0.05",
  "license" => "perl",
  "module_name" => "AnyEvent::Git::Wrapper",
  "recommends" => {
    "EV" => 0
  },
  "recursive_test_files" => 1,
  "requires" => {
    "AnyEvent" => 0,
    "AnyEvent::Open3::Simple" => "0.75",
    "File::pushd" => 0,
    "Git::Wrapper" => "0.030",
    "Scalar::Util" => 0,
    "perl" => "5.006"
  },
  "script_files" => [],
  "test_requires" => {
    "Sort::Versions" => 0,
    "Test::Deep" => 0,
    "Test::Exception" => 0
  }
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  my $tr = delete $module_build_args{test_requires};
  my $br = $module_build_args{build_requires};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
