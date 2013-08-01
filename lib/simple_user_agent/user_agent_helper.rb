class UserAgentHelper
  DEVICE = {
    :c   => 'Computer',
    :t   => 'Tablet',
    :m   => 'Mobile',
    :oth => 'Other'
  }
  
  BROWSER = {
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
  
  # def self.device_name(key)
  #   key = key || :oth
  #   DEVICES[key.to_sym] || "Other"
  # end
  # 
  # def self.browser_name(key)
  #   key = key || :oth
  #   BROWSERS[key.to_sym] || "Other"
  # end
  # 
  # def self.os_name(key)
  #   key = key || :oth
  #   OS[key.to_sym] || "Other"
  # end


  # Brincando com method_missing :D
  def self.method_missing(method_name, *args, &block)
    raise ArgumentError.new('list name error') if not method_name =~ /\_name$/
    raise ArgumentError.new('wrong number of arguments (0 for 1)') if args.empty?

    list_name = method_name.to_s.gsub('_name', '').upcase #device_name vira DEVICE, por exemplo
    list = self.const_get(list_name)

    key = args.first || :oth
    list[key.to_sym] || "Other"
  end

end