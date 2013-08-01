# CHANGELOG

## 1.1.0
### 1 Aug 2013
* Helper created to return the device, browser and OS names from a key

## 1.0.0
### 18 May 2013
* Parses a UserAgent string and identify the Device (Compute, Tablet or Mobile), the Operating System and the Browser
* Returns only the keys, not the full name of each part, as folows:
``
	# DEVICES
	# :c => 'Computer'
	# :t => 'Tablet'
	# :m => 'Mobile'
	# :oth => 'Other'

	# OS
	# :mac => 'Mac OS'
	# :win => 'Windows'
	# :lnx => 'Linux'
	# :oth => 'Other'
	# 
	# :iph => 'iPhone'
	# :adr => 'Android' #and podia confundir ou gerar conflito 
	# :wip => 'Windows Phone'
	# :bkb => 'Blackberry'
	# :oth => 'Other'
	# 
	# :ipa => 'iPad'
	# :adr => 'Android'
	# :win => 'Windows'
	# :bkb => 'Blackberry'
	# :oth => 'Other'

	# BROWSER
	# :sf => 'Safari'
	# :ch => 'Chrome'
	# :ff => 'Firefox'
	# :ie => 'Internet Explorer'
	# :oth => 'Other'

``