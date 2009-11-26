package DemoFW::Plugin::Config;

use Encomp::Plugin qw/+ClassAccessor/;
use Storable qw/dclone/;

class_accessor 'config';

hook_to '/initialize' => sub {
    my ($self, $context, $args) = @_;
    my $class = ref $self;
    unless ($class->config) {
        my $path = exists $args->{config} ? delete $args->{config} : undef;
        $class->config($path
            ? do { require YAML::Any; YAML::Any::LoadFile($path) }
            : {}
        );
    }
    $self->config(dclone $class->config);
    return 1;
};

no  Encomp::Plugin;

1;

__END__
