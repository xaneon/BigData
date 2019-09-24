import socket 
import sys
import requests
import requests_oauthlib
import json

ACCESS_TOKEN = "YOUR_ACCESS_TOKEN"
ACCESS_SECRET = "YOUR_ACCESS_SECRET"
CONSUMER_KEY = "YOUR_CONSUMER_KEY"
CONSUMER_SECRET = "YOUR_CONSUMER_SECRET"
my_auth = requests_oauthlib.OAuth1(CONSUMER_KEY, 
                                   CONSUMER_SECRET, ACCESS_TOKEN, ACCESS_SECRET)

def get_tweets():
    url = "https://stream.twitter.com/1.1/statuses/filter.json"
    # TODO
