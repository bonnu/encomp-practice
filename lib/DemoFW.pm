package DemoFW;

use Encomp;

processes qw/
    initialize
    main
    finalize
/;

hook_to '/main' => sub {
    my $self = shift;
    $self->dispatch;
    1;
};

no  Encomp;

# handler 向け。このメソッドはコントローラに assign されない。
sub finalize {
    my ($class, $obj) = @_;
    $obj->result;
}

1;

__END__
