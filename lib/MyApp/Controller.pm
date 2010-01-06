package MyApp::Controller;

use Encomp::Controller;
use Data::Dump qw/pp/;

plugins qw/MyApp::Plugin::HelloWorld/;

sub dispatch {
    my $self = shift;
    $self->response->content_type('text/plain;');
    my $message  = $self->message . "\n";
    $self->message('Hello Japan !');
       $message .= $self->message . "\n";
    $self->response->body($message);
    $self->response->body(
        'hello world'                              . "\n" .
        'param->{foo}  : ' . $self->param->{foo}   . "\n" .
        'config->{foo} : ' . $self->config->{foo}  . "\n" .
        'dump(config)  : ' . pp($self->config)     . "\n" .
        'ref $self     : ' . ref($self)            . "\n" .
        'dump(complex) : ' . pp($self->complex)    . "\n" .
        q//,
    );
}

no  Encomp::Controller;

1;

__END__
