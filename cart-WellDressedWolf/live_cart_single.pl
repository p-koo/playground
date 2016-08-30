#!/usr/bin/perl
use strict;
use WWW::Mechanize;
use Data::Dumper;
use HTML::Form;
use LWP;

#-------------------------------------------------------------------------------
# Fill out info

# login info
my $username = 'myemail@gmail.com';
my $password = 'ABC123-not!';

# desired size
my $size = "3T";          
my $quantity = 1;

# credit card info
my $ccnumber = '1111111111111111';
my $ccmonth = '1';
my $ccyear = '2011';
my $cccode = '111';

# billing address info
my $firstname = 'first name';
my $lastname = 'last name';
my $company = '';
my $address = 'address';
my $address2 = '#1';
my $country = 'United States';
my $province = 'State name';
my $city = 'City name';
my $zipcode = '11111';
my $phone = '5555555555';

#-------------------------------------------------------------------------------

# website to log into
my $url = "http://www.welldressedwolf.com";

# gets the url info with cookies
my $mech = WWW::Mechanize->new();
$mech -> cookie_jar(HTTP::Cookies->new());
$mech->get($url);

# gets the login link
my $login =  $mech->find_link(text => 'Log in');

# goes to login
$mech->follow_link(url => $login->[0]);

# get form id
$mech->form_id('customer_login');
$mech->field("customer[email]",$username);
$mech->field("customer[password]",$password);
#$mech->field("hash",$hash);
my $response = $mech->submit();
#print $mech->content();  

if ($mech->status == 200) {
	print "login successful\n";
} else {
	print "failed to login\n";
}

#-------------------------------------------------------------------------------

# gets the url info
$mech->get($url);

# goes to product page
my $products = $mech->find_link(text=>'ALL');
$mech->follow_link(url => $products->[0]);

# set the template link
my $template = "http://www.welldressedwolf.com/collections/all/products/";
my @productlink = ();

# check to see if any links matches template structure
my @alllinks = $mech->find_all_links();
for my $link (@alllinks){
	my $address = $link->url_abs;
	if (index($address,$template) != -1) {
		push(@productlink,$address);
	}
}

# get all links with products listed
while ( my $next = $mech->find_link(text => 'Next')) {

	# get all followable links on page
	$mech->follow_link(url => $next->[0]);

	# check to see if any links matches template structure
	my @alllinks = $mech->find_all_links();
	for my $link (@alllinks){
		my $address = $link->url_abs;
		if (index($address,$template) != -1) {
			push(@productlink,$address);
		}
	}
}

# get rid of duplicates
my %count;
@productlink = grep{!$count{$_}++} @productlink;

#-------------------------------------------------------------------------------

# load a product link
for my $productIndex (@productlink){

	$mech->get($productIndex); 

	# load  add item form
	$mech->form_id('add-item-form');

	# get products and values
	my @list = $mech->find_all_inputs(id=>'product-select');
	my @dressname = ();
	my @dressvalue = ();
	for my $link(@list){
		my @names =  $link->value_names;
		for my $name(@names){
			push(@dressname,$name);
		}

		my @values = $link->possible_values;
		for my $value(@values){
			push(@dressvalue,$value);
		}
	}
	#print Dumper @list;
	#print Dumper @dressname;
	#print Dumper @dressvalue;

	my $arrSize = @dressname;
	my @dressIndex = (); 
	for(my $i=0; $i <= $arrSize; $i++){
		if (index($dressname[$i],$size) != -1) {
			print $dressname[$i];
			print "\n";
			print $dressvalue[$i];
			print "\n";
			push(@dressIndex,$dressvalue[$i]);
		}
	}

	# add to cart
	$mech->form_id('add-item-form');
	$mech->field("product-select",@dressIndex[0]);
	$mech->field("quantity",$quantity);
	my $response = $mech->submit();

	if ($mech->status == 200) {
		print "successful add to cart\n";
	} else {
		print "failed to add to cart\n";
	}
}

#-------------------------------------------------------------------------------

# checkout 
$mech->form_id('cartform');
$mech->click_button(
	value => "Checkout"
);

# billing address information
$mech->form_id('new_order');
$mech->field("billing_addres_country", $country);
$mech->field("billing_addres_province", $province);
#billing_address_first_name -> 'value_name'
#billing_address_last_name -> 'value_name'
#billing_address_company -> 'value_name'
#billing_address_address1 -> 'value_name'
#billing_address_address2 -> 'value_name'
#billing_address_city -> 'value_name' ->
#billing_address_zip -> 'value_name' -> 
#billing_address_phone -> 'value_name' ->
$mech->submit();


# purchase information
$mech->form_id('purchase-form');
$mech->field("credic_card_number", $ccnumber);
$mech->field("credit_card_month", $ccmonth);
$mech->field("credit_card_year", $ccyear);
$mech->field("credit_card_verification_value", $cccode);
$mech->submit();

# print final page to file
open my $out_file, '>>', 'purchase.txt' or die "$!";
print $out_file $mech->content(); 


