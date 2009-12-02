package MyApp::Controller;

use Encomp::Controller;
use Class::Inspector;
use Data::Dumper ();

sub dispatch {
    my $self = shift;
    $self->response->content_type('text/plain;');
    $self->response->body('hello world');
    $self->response->body(
        'hello world'                                                                   . "\n" .
        'request->param("foo") : ' . $self->request->param('foo')                       . "\n" .
        'config->{foo}         : ' . $self->config->{foo}                               . "\n" .
        'ref $self             : ' . ref($self)                                         . "\n" .
        'dump(all_complex)     : ' . Data::Dumper::Dumper(Encomp::Complex::all_complex) . "\n" .
        q//,
    );
}

no  Encomp::Controller;

1;

__END__
