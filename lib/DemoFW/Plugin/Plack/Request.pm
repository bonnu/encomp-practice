package DemoFW::Plugin::Plack::Request;

use Encomp::Plugin qw/+Accessor/;
use Plack::Request;

plugins qw/
    DemoFW::Plugin::Param
    DemoFW::Plugin::PSGI
/;

accessor 'request';

hook_to '/initialize' => sub {
    my ($self, $context, $args) = @_;
    $self->request(
        exists $args->{plack_request}
            ? delete $args->{plack_request}
            : Plack::Request->new($self->psgi_env)
    );
    $self->param($self->request->parameters);
    return 1;
};

no  Encomp::Plugin;

1;

__END__
