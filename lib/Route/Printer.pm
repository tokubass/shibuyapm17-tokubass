package Route::Printer;
use 5.008001;
use strict;
use warnings;
use Text::MicroTemplate qw/:all/;
use Class::Accessor::Lite (rw => [qw/ req routes /]);
use File::Spec;
use Data::Dumper;
use Encode;

our $VERSION = "0.01";

sub new {
    my $class = shift;
    bless {@_}, $class;
}

sub add {
    my $self = shift;
    my ($controller,$action) = split('#',$_[2],2);
    push @{$self->{routes}}, {
        method => $_[0],
        path => $_[1],
        controller => $controller,
        action => $action,
        extended => $_[3] || {},
    };
    return $self;
}


sub as_html {
    my $self = shift;
    my $mt = Text::MicroTemplate->new(
        template => $self->template,
    );
    my $code = $mt->code;
    my $renderer = eval << "..." or die $@;
sub {
    my \$routes = shift;
    $code->();
}
...

    return $renderer->($self->routes);
}


sub create_response {
    my $self = shift;

    require Plack::Response;
    my $res = Plack::Response->new(200);
    $res->content_type('text/html');
    return $res;
}

sub pod2html {
    my $self = shift;
    my $controller = shift;
    my $action = shift;
    require Pod::Simple::HTML;
    require File::ShareDir;
    require Class::Inspector;

    my $p = Pod::Simple::HTML->new;
    $p->index(1);
    $p->html_css('<link rel="stylesheet" type="text/css" href="http://search.cpan.org/s/style.css">');

    $p->output_string(\my $html);
    my $module_path = Class::Inspector->resolved_filename($controller) or return 'file not found';
    $p->parse_file($module_path);

    return $html;
}

sub template {
    shift->{template_string};
}

1;


