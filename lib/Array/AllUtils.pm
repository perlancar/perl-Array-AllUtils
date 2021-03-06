package Array::AllUtils;

# DATE
# VERSION

#IFUNBUILT
use strict 'vars', 'subs';
use warnings;
#END IFUNBUILT

require Exporter;
our @EXPORT_OK = qw(
                       first
                       firstidx
               );

sub import {
  my $pkg = caller;

  # (RT88848) Touch the caller's $a and $b, to avoid the warning of
  #   Name "main::a" used only once: possible typo" warning
  #no strict 'refs';
  #${"${pkg}::a"} = ${"${pkg}::a"};
  #${"${pkg}::b"} = ${"${pkg}::b"};

  goto &Exporter::import;
}

# BEGIN_BLOCK: first
sub first(&$) {
    my $code = shift;
    for (@{$_[0]}) {
        return $_ if $code->($_);
    }
    undef;
}
# END_BLOCK: first

# BEGIN_BLOCK: firstidx
sub firstidx(&$) {
    my $code = shift;
    my $i = 0;
    for (@{$_[0]}) {
        return $i if $code->($_);
        $i++;
    }
    -1;
}
# END_BLOCK: firstidx

1;
# ABSTRACT: Like List::Util & List::MoreUtils but for array(ref)

=head1 SYNOPSIS

 use Array::AllUtils qw(
     first firstidx
 );

 my @ary = (1..20);

 my $elem = first    { defined and $_ % 2 == 0 } $ary; # -> 2
 my $idx  = firstidx { defined and $_ % 5 == 0 } $ary; # -> 4


=head1 DESCRIPTION

B<PURELY EXPERIMENTAL AND CURRENTLY INCOMPLETE.>

This module provides functions like those provided by L<List::Util> and
L<List::MoreUtils> but the list is passed as arrayref, to avoid the cost of
argument copying which can be significant when the size of the list is large.
See an illustration in L<Bencher::Scenario::PERLANCAR::In>.


=head1 FUNCTIONS

=head2 first

=head2 firstidx


=head1 SEE ALSO

L<List::Util>, L<List::MoreUtils>, L<List::AllUtils>
