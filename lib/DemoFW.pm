package DemoFW;

use Encomp;

plugins qw/
    DemoFW::Plugin::Config
    DemoFW::Plugin::Plack
/;

processes qw/
    initialize
    main
    finalize
/;

hook_to '/main' => sub { shift->dispatch; 1 };

no  Encomp;

1;

__END__
