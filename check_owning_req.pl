#!/usr/bin/perl

use Module::Load::Conditional qw[can_load check_install requires];

    my $mods = {
            LWP             => 5.60,
            HTTP::Request   => 6.00,
            Tiny::Test      => 7.00,
    };

	print can_load( modules => $mods )
            ? "Los Modulos de perl requeridos están instalados \n"
            : "No se cargaron los módulos necesarios \nInstala HTTP y LWP:\n cpan install HTTP::Request\n cpan install LWP\n";
            
	my $rv = check_install( module => 'LWP', version => 5.60 )
                or print 'LWP no está instalado!';
