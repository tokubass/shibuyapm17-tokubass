package MyApp::Web::C::Api::Arena;
use strict;
use warnings;
use utf8;

sub create {
    my ($class,$c,$args) = @_;
    return $c->render_json({
        "arena" =>  {
            "id" =>  "4e9dbbc2-830b-41a9-b7db-9987735a0b2a",
            "name" =>  "hogehoge",
            "latitude" =>  40.721294,
            "longitude" =>  -73.983994,
            "foursquare_id" =>  "5104"
        }
    });


}

sub show {
    my ($class,$c,$args) = @_;
    return $c->render_json({
        "arena" =>  {
            "id" =>  "4e9dbbc2-830b-41a9-b7db-9987735a0b2a",
            "name" =>  "hogehoge",
            "latitude" =>  40.721294,
            "longitude" =>  -73.983994,
            "foursquare_id" =>  "5104"
        }
    });

}


1;

