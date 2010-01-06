package DemoFW::Plugin::Config;

use Encomp::Plugin qw/+ClassAccessor/;
use File::Spec;
use Storable ();

class_accessor 'config';
class_accessor 'root_dir';

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
    $self->config(Storable::dclone $class->config);
    unless ($class->root_dir) {
        $class->root_dir(File::Spec->rel2abs($args->{root_dir} || q{}));
    }
};

no  Encomp::Plugin;

1;

__END__
