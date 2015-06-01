use HTTP::Request::Common;
use Test::More;
use Test::JsonAPI::Autodoc;

my $template = <<'TEMP';
: for $results -> $result {

# <: $description :>

+ Request (<: $result.request_content_type :>)

: if $result.request_parameters {
: for $result.request_parameters -> $parameter {
<: $parameter :>
: }
: }
: else {
: }

+ Response <: $result.status :> (<: $result.response_content_type :>)

        <: $result.response_body :>

:}
TEMP

set_template($template);


describe 'POST /api/arena' => sub {
    my $req = POST $ENV{TEST_PERLD_HOST} . '/api/arena';
    $req->header('Content-Type' => 'application/json');
    $req->content('{ "name": "hogehoge" }');
    http_ok($req, 200);
};

describe 'GET /api/arena/:id' => sub {
    my $req = GET $ENV{TEST_PERLD_HOST} . '/api/arena/1';
    http_ok($req, 200);
};


done_testing;
