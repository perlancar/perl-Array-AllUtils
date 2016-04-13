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

1;
# ABSTRACT: Like List::Util & List::MoreUtils but for array(ref)

=head1 SYNOPSIS

 use Array::AllUtils qw(first);

 my @ary = (1..20);

 $elem = first { defined and $_ % 2 } $ary;


=head1 DESCRIPTION

B<PURELY EXPERIMENTAL AND CURRENTLY INCOMPLETE.>

This module provides functions like those provided by L<List::Util> and
L<List::MoreUtils> but the list is passed as arrayref, to avoid the cost of
argument copying which can be significant when the size of the list is large.
See an illustration in L<Bencher::Scenario::PERLANCAR::In>.


=head1 FUNCTIONS

=head2 first


=head1 SEE ALSO

L<List::Util>, L<List::MoreUtils>, L<List::AllUtils>
