package DemoFW::Plugin::Plack::Env;

use Encomp::Plugin;

use base qw/Class::Accessor::Fast/;

__PACKAGE__->mk_accessors(qw/psgi_env/);

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
