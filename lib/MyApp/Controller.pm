package MyApp::Controller;

use Encomp::Controller;
use Class::Inspector;
use Data::Dumper ();

plugins qw/MyApp::Plugin::HelloWorld/;

sub dispatch {
    my $self = shift;
    $self->response->content_type('text/plain;');
    my $message  = $self->message . "\n";
    $self->message('Hello Japan !');
       $message .= $self->message . "\n";
    $self->response->body($message);
=pod
    $self->response->body(
        'hello world'                                                                   . "\n" .
        'request->param("foo") : ' . $self->request->param('foo')                       . "\n" .
        'config->{foo}         : ' . $self->config->{foo}                               . "\n" .
        'ref $self             : ' . ref($self)                                         . "\n" .
        'dump(all_complex)     : ' . Data::Dumper::Dumper(Encomp::Complex::all_complex) . "\n" .
        q//,
    );
=cut
}

no  Encomp::Controller;

1;

__END__
