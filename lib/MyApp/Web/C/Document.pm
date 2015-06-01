package MyApp::Web::C::Document;
use strict;
use warnings;
use utf8;
use Route::Printer;
use File::Slurp qw/read_file/;
    
sub index {
    my ($class, $c, $args) = @_;
    my $home = $c->project_home;
    my $rp =  Route::Printer->new;
    $rp->{template_string} = read_file($home . '/tmpl/api_document_index');
    my $routes = MyApp::Web::Dispatcher->router()->{data};

    for my $path (sort keys %$routes) {
        my $http_methods = $routes->{$path}[0][0];
        my $dest = $routes->{$path}[0][1];
        my $controller   = $dest->{class};
        my $dispatch_method = $dest->{method};

        for my $http_method (@$http_methods) {
            next if $http_method eq 'HEAD';
            $rp->add(
                $http_method,
                $path,
                "${controller}#${dispatch_method}"
            );
        }
    }

    my $psgi_response = $rp->create_response;
    $psgi_response->body($rp->as_html);
    return $psgi_response;
}


1;

