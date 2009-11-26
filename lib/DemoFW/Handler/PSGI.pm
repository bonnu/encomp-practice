package DemoFW::Handler::PSGI;

use strict;
use warnings;
use DemoFW;
use File::Spec;

sub handler {
    my ($class, %args) = @_;
    my $file   = $args{file};
    my @paths  = File::Spec->splitdir($file);
    my $base   = File::Spec->catdir(splice @paths, 0, $#paths);
    my $config = File::Spec->rel2abs($args{config}, $base);
    sub {
        my $env = shift;
        my $app = 'MyApp::Controller';
        DemoFW->operate(
            [
                $app,
                qw/DemoFW::Plugin::PSGI/,
            ],
            {
                config     => $config,
                psgi_env   => $env,
            },
        )->psgi_response;
    };
}

1;

__END__
