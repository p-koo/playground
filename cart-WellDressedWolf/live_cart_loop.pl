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

# gets the login link
my $login =  "http://www.welldressedwolf.com/account/login/";
$mech->get($login);

# get form id
$mech->form_id('customer_login');
$mech->field("customer[email]",$username);
$mech->field("customer[password]",$password);
#$mech->field("hash",$hash);
my $response = $mech->submit();

# check to see if login successful
if ($mech->status == 200) {
	print "login successful\n";
} else {
	print "failed to login\n";
}


#-------------------------------------------------------------------------------

# set the template link
my $template = "http://www.welldressedwolf.com/collections/all/products/";

my $buyIndex = 0;
my $match = 0;
my $status = 1;
while ($status == 1){

	# gets the url info
	$mech->get($url);

	# goes to login
	my $products = $mech->find_link(text=>'ALL');
	$mech->follow_link(url => $products->[0]);

	# check to see if any link on first page matches template structure
	my @productlink = ();
	my @alllinks = $mech->find_all_links();
	for my $link (@alllinks){
		my $address = $link->url_abs;
		if (index($address,$template) != -1) {
			push(@productlink,$address);
		}
	}
	
	# get rid of duplicates
	my %count;
	@productlink = grep{!$count{$_}++} @productlink;

	# if found a product, then add to cart
	my $numProducts = @productlink;
	if ($numProducts > 0){
		
		# load a product link
		my $index = 1;
		for my $productIndex (@productlink){
			
			# if current product is equal to buyIndex
			if ($index == $buyIndex){
				print $productIndex;
				print "\n";
			
				# finding products to purchase
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
	
				my $arrSize = @dressname;
				my @dressIndex = (); 
				for(my $i=0; $i <= $arrSize; $i++){
					if (index($dressname[$i],$size) != -1) {
						$status = 0;
						$match = 1;
						print $dressname[$i];
						print "\n";
						push(@dressIndex,$dressvalue[$i]);
					}
				}
				if ($match == 1){
					# add to cart
					$mech->form_id('add-item-form');
					$mech->field("product-select",@dressIndex[0]);
					$mech->field("quantity",$quantity);
					my $response = $mech->submit();
				}else{
					print "no size match\n";
					$status = 0;
				}
			}
		
			$index++;
		}
	}else{
		print "no products found\n";
	}
}


#-------------------------------------------------------------------------------

if ($match == 1){
	# checkout 
	print "checking out\n";
	$mech->form_id('cartform');
	$mech->click_button(
		value => "Checkout"
	);

	# billing address information
	$mech->form_id('new_order');
	$mech->field("billing_addres_country",$country);
	$mech->field("billing_addres_province",$province);
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
	$mech->field("credit_card[number]",$ccnumber);
	$mech->field("credit_card[month]",$ccmonth);
	$mech->field("credit_card[year]",$ccyear);
	$mech->field("credit_card[verification_value]",$cccode);
	$mech->submit();
		

	# print forms of final page
	my @forms = $mech->forms();
	foreach my $form (@forms){ 
		print Dumper $form;
		print "\n";
	}
		
	print "Finished purchase\n";
	open my $out_file, '>>', $purchasefile or die "$!";
	print $out_file "__________________________________________________________________________________________________________________________\n";
	print $out_file $mech->content(); 
	print $out_file "___________________________________________________________________________________________________________________________\n";
	}
	 
}
