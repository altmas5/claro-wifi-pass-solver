#!/usr/bin/perl

use Module::Load::Conditional qw[can_load check_install requires];

    my $mods = {
            LWP             => 5.60,
            HTTP::Request   => 6.00,
    };
    	print "Verificando requisitos... \n";
	sleep(1);
	print can_load( modules => $mods )
	   ? "Los Modulos de perl requeridos están instalados \n"
	   : "No se cargaron los módulos de perl necesarios \nInstala HTTP y LWP:\n sudo cpan install HTTP::Request LWP\n";
            
	my $rv = check_install( module => 'LWP', version => 5.60 )
                or print 'LWP no está instalado!';
