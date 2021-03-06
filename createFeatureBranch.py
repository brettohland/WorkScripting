#!/usr/bin/env python
import datetime, sys, getpass
import subprocess as sb

def todays_date_as_string():
	cur_date = datetime.date.today()
	return cur_date.strftime("%y%m%d")

def branch_with_ticket(ticket_info):
	return 'feature/'+ getpass.getuser() +'/' + todays_date_as_string() + '-' + ticket_info 

def create_new_branch():
	sb.call(['git', 'checkout', '-b', branch_with_ticket(sys.argv[1])])

create_new_branch()



		

			


