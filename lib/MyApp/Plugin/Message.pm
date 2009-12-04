package MyApp::Plugin::Message;

use Encomp::Plugin qw/+ClassAccessor/;

class_accessor message => '';

no  Encomp::Plugin;

1;

__END__
