# Helpful links:
# http://msdn.microsoft.com/en-us/library/ie/hh920767(v=vs.85).aspx
# https://developer.mozilla.org/en-US/docs/Browser_detection_using_the_user_agent
# https://developers.google.com/chrome/mobile/docs/user-agent
# http://developer.apple.com/library/safari/#documentation/appleapplications/reference/safariwebcontent/OptimizingforSafarioniPhone/OptimizingforSafarioniPhone.html
# http://supportforums.blackberry.com/t5/Web-and-WebWorks-Development/How-to-detect-the-BlackBerry-Browser/ta-p/559862
# http://www.developer.nokia.com/Community/Wiki/User-Agent_headers_for_Nokia_devices

require 'simple_user_agent/version'

require 'simple_user_agent/parsers/operating_system'
require 'simple_user_agent/parsers/browser'
require 'simple_user_agent/parsers/device'

require 'simple_user_agent/user_agent'
require 'simple_user_agent/user_agent_parser'

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

