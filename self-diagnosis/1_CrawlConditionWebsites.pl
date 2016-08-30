#!/usr/bin/perl
use strict;
use WWW::Mechanize;
use Data::Dumper;
use HTML::Form;
use LWP;

my $mech = WWW::Mechanize->new();
$mech -> cookie_jar(HTTP::Cookies->new());

# website info
my $base_url = "http://www.mayoclinic.org/diseases-conditions/index?letter=";
my @alphabet = ("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z");
my $base_template = "/diseases-conditions/";
my $exclude_template = "/index";

# loop through each webpage and extract links to all diseases
my $counter = 0;
my @disease_links = ();
for my $letter (@alphabet){
	print "Extracting Letter: " . $letter . "\n";

	# set new url 
	my $url = $base_url . $letter;

	# get html content
	$mech->get($url);
	#print $mech->content();

	# loop through all links that match base_template and not exclude_template
	my @all_links = $mech->find_all_links();
	for my $link (@all_links){
		my $address = $link->url_abs;
		if (index($address,$base_template) != -1 && index($address,$exclude_template) == -1) {
			push(@disease_links,$address);
			print $address . "\n";
			$counter += 1;
		}
	}
}

# get rid of duplicate links
my %count;
@disease_links = grep{!$count{$_}++} @disease_links;

# loop through disease links and get symptoms of each disease
my $definition = "definition";
my $symptoms = "symptoms";
$symptoms = quotemeta $symptoms;

open my $out_file, '>>', "Links.txt"  or die "$!";
for my $link (@disease_links){	
	$link =~ s/$definition/$symptoms/g;
	print $out_file $link . "\n";
}

	
