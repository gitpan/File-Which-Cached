package File::Which::Cached;
use strict;
use File::Which();
use Exporter;
use vars qw($VERSION @ISA @EXPORT_OK);
@ISA = qw/ Exporter /;
$VERSION = sprintf "%d.%02d", q$Revision: 1.2 $ =~ /(\d+)/g;
@EXPORT_OK = ('which');

$File::Which::_cache ||= {};

sub which {
   my $what = shift;
   defined $what or die('missing arg to which()');
   $File::Which::_cache->{$what} ||= File::Which::which($what) or return;
   return  $File::Which::_cache->{$what};
}

1;


__END__

=pod

=head1 NAME

File::Which::Cached

=head1 SYNOPSIS

   use File::Which::Cached 'which';

   my $perl_bin = which('perl');


=head1 DESCRIPTION

This is a wrapper around File::Which that caches results to a package symbol.
If you have a sub or method that makes multiple calls to which, and maybe the
same executable lookup, you may want to do this.

File::Which does not cache results in the package. That means that if you call 
which twice for the same executable, it performs twice.

This module will save the result, so that if your code is called to lookup an 
executable a thousand times, it takes just as long as one time.

This is desirable in iterations of many calls, etc.
In 2 thousand calls, we save one second.

=head1 which()

argument is name of executable, returns abs path to file.
takes one argument at a time.

=head1 SEE ALSO

File::Which

=head1 AUTHOR

Leo Charre leocharre at cpan dot org

=cut

