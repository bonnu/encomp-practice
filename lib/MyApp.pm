package MyApp;

use Encomp;

incorporate 'Nido';

config '../config.yaml';

hook_to '/main/dispatch/correct' => sub { shift->dispatch };

no  Encomp;

1;

__END__
