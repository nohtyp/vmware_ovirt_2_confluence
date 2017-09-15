#!/usr/bin/env python
#
# Modified to incorporate Zohar Melamed (page source xml-rpc awesome regex) and Charles Miller (xml-rpc updater page updater)
# Added username and password so the password is not stored in the file in plain-text.
# Reads input from command-line and creates data for page.
# You will need the output in html format or you can script a page in html output to create the string for your page :-)
# I used this script to create a test page so my servers would document themselves in confluence
# This should create a Hello World page in Confluence
#
# Ex: python modify-page.py 

import sys
import re
import getpass
from xmlrpclib import Server
 
  

url = "<url to page you want to change>"

content = open("<file that you send output data to>.txt", "r")
   
terms = re.match('(?i)(^.*?)(?:/display/)(.*?)/(.*$)',url).groups();
    

username = '<username that has access to change page>'
passwd = '<password for user above>'

server = terms[0]
space  = terms[1]
page   = terms[2].replace('+',' ')
     
s = Server(server + "/rpc/xmlrpc")

token = s.confluence2.login(username, passwd)
page = s.confluence2.getPage(token, space, page)
page["content"] = content.read()
s.confluence2.storePage(token, page)
