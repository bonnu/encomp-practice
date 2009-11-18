package MyApp::Controller;

use Encomp::Controller;

plugins 'DemoFW::Plugin::Plack';

sub dispatch {
    my $self = shift;
    $self->response->content_type('text/plain;');
    $self->response->body('hello world');
}

sub result {
    my $self = shift;
    $self->response->finalize;
}

no  Encomp::Controller;

1;

__END__
