package DemoFW;

use Encomp;

plugins qw/
    DemoFW::Plugin::Config
    DemoFW::Plugin::Plack
/;

processes
    initialize =>
    main       => [
        before      => [
            authentication => # login
            limitation     => # access control / access block
        ] =>
        dispatch    => [      # mode / conditions
            correct        => # mode / templates / assign
        ] =>
        after       => [
            render         => # template->output
            filter         => # encode / etc ...
            output         => # body
            effect         => # foot print
        ] =>
    ],
    finalize   =>
;

hook_to '/main/dispatch/correct' => sub { shift->dispatch };

no  Encomp;

1;

__END__
