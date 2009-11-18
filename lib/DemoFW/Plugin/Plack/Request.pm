package DemoFW::Plugin::Plack::Request;

use Encomp::Plugin;
use base qw/Class::Accessor::Fast/;
use Plack::Request;

plugins 'DemoFW::Plugin::Plack::Env';

__PACKAGE__->mk_accessors(qw/request/);

hook_to '/initialize' => sub {
    my ($self, $context, $args) = @_;
    $self->request(
        exists $args->{plack_request}
            ? delete $args->{plack_request}
            : Plack::Request->new($self->psgi_env)
    );
    return 1;
};

no  Encomp::Plugin;

1;

__END__
