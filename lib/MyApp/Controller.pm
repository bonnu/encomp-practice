package MyApp::Controller;

use Encomp::Controller;

sub dispatch {
    my $self = shift;
    $self->response->content_type('text/plain;');
    $self->response->body('hello world' . "\n" . $self->config->{foo});
}

no  Encomp::Controller;

1;

__END__
