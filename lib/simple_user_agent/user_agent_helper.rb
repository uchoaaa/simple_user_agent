class UserAgentHelper
  DEVICES = {
    :c   => 'Computer',
    :t   => 'Tablet',
    :m   => 'Mobile',
    :oth => 'Other'
  }

  def self.device_name(device_key)
    key = device_key || :oth
    DEVICES[key.to_sym] || "Other"
  end
end