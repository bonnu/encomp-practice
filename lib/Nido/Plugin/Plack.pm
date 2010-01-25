package Nido::Plugin::Plack;

use Encomp::Plugin;

plugins qw/
    Nido::Plugin::Plack::Request
    Nido::Plugin::Plack::Response
/;

no  Encomp::Plugin;

1;

__END__
