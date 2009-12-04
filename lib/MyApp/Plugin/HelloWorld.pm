package MyApp::Plugin::HelloWorld;

use Encomp::Plugin;

plugins qw/MyApp::Plugin::Message/;

__PACKAGE__->message('Hello World !');

no  Encomp::Plugin;

1;

__END__
