package DemoFW::Handler::PSGI;

use strict;
use warnings;
use DemoFW;

sub handler {
    my $env   = shift;
    my $class = 'MyApp::Controller'; # router ��Ź���ʤ餳������������
    my $obj   = DemoFW->operate(
        $class,
        {
            psgi_env => $env,
        },
    );
    DemoFW->finalize($obj);
}

1;

__END__