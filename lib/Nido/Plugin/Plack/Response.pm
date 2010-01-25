package Nido::Plugin::Plack::Response;

use Encomp::Plugin qw/+Accessor/;
use Plack::Response;

plugins qw/
    Nido::Plugin::PSGI
    Nido::Plugin::Plack::Request
/;

accessor 'response';

hook_to '/initialize' => sub {
    my ($self, $context, $args) = @_;
    $self->response(
        exists $args->{plack_response}
            ? delete $args->{plack_response}
            : $self->request->new_response(200)
    );
    return 1;
};

hook_to '/finalize' => sub {
    my $self = shift;
    $self->psgi_response($self->response->finalize);
};

no  Encomp::Plugin;

1;

__END__
