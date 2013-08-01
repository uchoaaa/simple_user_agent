class UserAgentHelper
  DEVICES = {
    :c   => 'Computer',
    :t   => 'Tablet',
    :m   => 'Mobile',
    :oth => 'Other'
  }
  
  def self.device_name(device_key)
    DEVICES[device_key.to_sym]
  end
end