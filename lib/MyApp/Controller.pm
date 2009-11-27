package MyApp::Controller;

use Encomp::Controller;
use Class::Inspector;
use Data::Dumper ();

sub dispatch {
    my $self = shift;
    $self->response->content_type('text/plain;');
    $self->response->body(
        'hello world'           . "\n" .
        $self->config->{foo}    . "\n" .
        ref($self)              . "\n" .
        Data::Dumper::Dumper(Encomp::Complex::all_complex) . "\n" .
        q//,
    );
}

no  Encomp::Controller;

1;

__END__
