class UserAgentHelper
  DEVICES = {
    :c   => 'Computer',
    :t   => 'Tablet',
    :m   => 'Mobile',
    :oth => 'Other'
  }
  
  BROWSERS = {
    :sf  => 'Safari',
    :ch  => 'Chrome',
    :ff  => 'Firefox',
    :ie  => 'Internet Explorer',
    :oth => 'Other'
  }
  
  OS = {
    :mac => 'Mac OS',
    :win => 'Windows',
    :lnx => 'Linux',

    :iph => 'iPhone',
    :adr => 'Android', #:and podia confundir ou gerar conflito
    :wip => 'Windows Phone',
    :bkb => 'Blackberry',

    :ipa => 'iPad',
    :adr => 'Android',
    :win => 'Windows',
    :bkb => 'Blackberry',

    :oth => 'Other'
  }

  def self.device_name(device_key)
    key = device_key || :oth
    DEVICES[key.to_sym] || "Other"
  end

  def self.browser_name(key)
    key = key || :oth
    BROWSERS[key.to_sym] || "Other"
  end

  def self.os_name(key)
    key = key || :oth
    OS[key.to_sym] || "Other"
  end
end