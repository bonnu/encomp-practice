package DemoFW::Plugin::Plack::Response;

use Encomp::Plugin;
use base qw/Class::Accessor::Fast/;
use Plack::Response;

plugins 'DemoFW::Plugin::Plack::Request';

__PACKAGE__->mk_accessors qw/response/;

hook_to '/initialize' => sub {
    my ($self, $context, $args) = @_;
    $self->response(
        exists $args->{plack_response}
            ? delete $args->{plack_response}
            : $self->request->new_response(200)
    );
    return 1;
};

no  Encomp::Plugin;

1;

__END__
