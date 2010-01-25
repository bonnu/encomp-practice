package Nido::Handler::PSGI;

use strict;
use warnings;
use Nido;
use File::Spec;

sub handler {
    my ($class, %args) = @_;
    my $file = $args{file} || (caller 0)[1];
    my $base = $args{base} || do {
        my @paths = File::Spec->splitdir($file);
        File::Spec->catdir(splice @paths, 0, $#paths);
    };
    my $config = File::Spec->rel2abs($args{config}, $base);
    sub {
        my $env = shift;
        my $app = 'MyApp::Controller';
        my $obj = Nido->operate(
            [
                $app,
                qw/Nido::Plugin::PSGI/,
            ],
            {
                config   => $config,
                psgi_env => $env,
                root_dir => $base,
            },
        );
        $obj->psgi_response;
    };
}

1;

__END__
