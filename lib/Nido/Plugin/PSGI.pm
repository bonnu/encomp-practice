package Nido::Plugin::PSGI;

use Encomp::Plugin qw/+Accessor/;

accessors qw/
    psgi_env
    psgi_response
/;

hook_to '/initialize' => sub {
    my ($self, $context, $args) = @_;
    $self->psgi_env(
        exists $args->{psgi_env}
            ? delete $args->{psgi_env}
            : {}
    );
    return 1;
};

no  Encomp::Plugin;

1;

__END__
