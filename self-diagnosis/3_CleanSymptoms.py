#!/usr/bin/python
import pandas as pd
from bs4 import BeautifulSoup
import re
import nltk
nltk.download()
from nltk.corpus import stopwords

def clean_words(description):
    
    # parse html
    example1 = BeautifulSoup(description).get_text()

    # remove non-letters
    letters_only = re.sub("^a-zA-Z]"," ", example1.get_text() )

    # convert to lower case and slit individual words
    lower_case = letters_only.lower().split()

    # convert stop words to a set
    stops = set(stopwords.words("english"))

    # remove stop words
    meaningful_words = [w for w in words if no w in stops]

    # return meaningful words
    return " ".join(meaningful_words)


def main():
    conditions = pd.read_csv("symptoms.csv",header=0,delimiter=",")
    num_conditions = conditions["name"].size

    clean_symptoms = []
    for i in xrange(0,num_conditions):
        clean_symptoms.append(clean_words(symptoms))
    


