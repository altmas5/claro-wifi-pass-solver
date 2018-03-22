#!/usr/bin/perl

use strict; 
use warnings;
use Module::Load::Conditional qw[can_load check_install requires];

    my $mods = {
            "LWP"             => 5.60,
            "HTTP::Request"   => 6.00,
    };
    	print "Verificando requisitos... \n";
	print can_load( modules => $mods )
	   ? "Los Modulos de perl requeridos están instalados \n"
	   : "No se cargaron los módulos de perl necesarios \nInstalarlos:\n sudo cpan install HTTP::Request LWP\n";
            
	my $ins = check_install( module => 'LWP', version => 5.60, verbose => 1)
	        or print "LWP no está instalado!\n";

	print "Se requiere LWP 5.60 o superior, la versión instalada es $ins->{version}\n" if !($ins->{uptodate});
