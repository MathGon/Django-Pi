try:
	import django

	print 'Using python, print out the django version number'
	print django.get_version()
except ImportError:
	print "Looks like Django had some problems installing.\nTry troubleshooting at http://www.raspberrypi.org/phpBB3/viewtopic.php?t=7208&p=403771"
