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

  def self.device_name(device_key)
    key = device_key || :oth
    DEVICES[key.to_sym] || "Other"
  end

  def self.browser_name(key)
    key = key || :oth
    BROWSERS[key.to_sym] || "Other"
  end
end