# Helpful links:
# http://msdn.microsoft.com/en-us/library/ie/hh920767(v=vs.85).aspx
# https://developer.mozilla.org/en-US/docs/Browser_detection_using_the_user_agent
# https://developers.google.com/chrome/mobile/docs/user-agent
# http://developer.apple.com/library/safari/#documentation/appleapplications/reference/safariwebcontent/OptimizingforSafarioniPhone/OptimizingforSafarioniPhone.html
# http://supportforums.blackberry.com/t5/Web-and-WebWorks-Development/How-to-detect-the-BlackBerry-Browser/ta-p/559862
# http://www.developer.nokia.com/Community/Wiki/User-Agent_headers_for_Nokia_devices

# TODO:
# Retornar apenas uma chave, uma refêrencia, para salvar no Mongo. Não é necessário salvar as Strings completas.
# Refactor: add alias 'platform' para 'os'

# (?) I18n: Computer, ordenador, computador..
# (?) Add UA de App como agregadores (Flipboard), Google Reader, etc
# (?) Add UA de crawlers (google, bing, facebook, etc) #acho que não precisa pq essa chamada para identificar vem via JS

require 'simple_user_agent/version'

require 'simple_user_agent/parsers/operating_system'
require 'simple_user_agent/parsers/browser'
require 'simple_user_agent/parsers/device'

require 'simple_user_agent/user_agent'
require 'simple_user_agent/user_agent_parser'
