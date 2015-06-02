package MyApp::Web::Dispatcher;
use strict;
use warnings;
use utf8;
use Amon2::Web::Dispatcher::RouterBoom;
use MyApp::Web::C::Api::Arena;
use MyApp::Web::C::Document;

get '/api/arena/:id' => 'MyApp::Web::C::Api::Arena#show';
post '/api/arena' => 'MyApp::Web::C::Api::Arena#create';


if ($ENV{PLACK_ENV} eq 'development') {
    get '/document' => 'MyApp::Web::C::Document#index';
}




1;
