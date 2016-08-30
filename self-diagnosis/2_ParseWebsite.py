#!/usr/bin/python

import mechanize
from bs4 import BeautifulSoup
import csv

# instantiate mechanize browser
br = mechanize.Browser()
br.set_handle_gzip(False)
br.set_handle_robots(False)

# load list of html files
with open('Links.txt') as fp:
    for link in fp:

	website = br.open(link)
	html = website.read()

	# instantiate Beautiful Soup
	soup = BeautifulSoup(html)
	
	# condition name
	tag = soup.h1.a
	name = tag.string
	print name

	# find intro content where symptoms
	tag = soup.find(id='main-content')
	if 'None' not in str(tag) and 'None' not in str(tag.p):
	    s = str(tag.p)
	    intro = s[3:-4]
	    print intro

    	    # set up parse for each symptom
	    base = "soup.find(id='main-content')"
	    add_another = ".findNext('li')"

    	    # store symptoms in list
	    counter = 0;
	    symptoms = [name, intro]
    	    status = 1
	    while status == 1:
	        base += add_another
	        tag = eval(base)
	        if ('None' in str(tag) or 'href' in str(tag)):
		    status = 0
	        else:
		    s = str(tag)
		    print s[4:-5]
		    #symptoms.append(BeautifulSoup(s[4:-5]).get_text())
		    symptoms.append(s[4:-5])
		    counter += 1
	    # display all of the symptoms
	    #print name
	
	    if counter > 0:
	        # print symptoms
	        with open('symptoms2.csv','a') as f:
	    	    writer = csv.writer(f)
		    writer.writerows([symptoms])
