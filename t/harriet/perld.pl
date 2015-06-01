use t::Util;

$ENV{TEST_PERLD} ||= do {
    unless ($ENV{PLACK_ENV} eq 'test') {
        die "need test environment";
    }

    require Test::TCP;
    require File::ProjectHome;
    my $pj_home = File::ProjectHome->project_home;
    my $server = Test::TCP->new(
        code => sub {
            my $port = shift;
            my $HOME= $ENV{HOME};
            exec 'carton', 'exec', '--', 'perl', "$pj_home/script/myapp-server", '-p', $port;
            die $!;
        }
    );
    $HARRIET_GUARDS::PERLD = $server;
    '127.0.0.1:' . $server->port;
};
$ENV{TEST_PERLD_HOST} = sprintf("http://%s", $ENV{TEST_PERLD});
