package DemoFW::Plugin::Plack;

use Encomp::Plugin;

plugins qw/
    DemoFW::Plugin::Plack::Request
    DemoFW::Plugin::Plack::Response
/;

no  Encomp::Plugin;

1;

__END__
