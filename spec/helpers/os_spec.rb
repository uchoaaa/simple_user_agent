# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

shared "OS name" do
  it "should return \"#{@name}\" to key :#{@key}" do
    UserAgentHelper.os_name(@key.to_sym).should == @name
    UserAgentHelper.os_name(@key.to_s).should   == @name
  end
end

describe 'UserAgentHelper' do
  describe 'OS names' do

    it 'should return correct name for the key' do
      {
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
      }.each do |key, name|
        @key = key
        @name = name
        behaves_like 'OS name'
      end
    end

    it 'should return "Other" to any other key' do
      UserAgentHelper.os_name(:wrong).should  == 'Other'
      UserAgentHelper.os_name('other thing').should  == 'Other'
      UserAgentHelper.os_name(nil).should  == 'Other'
    end
    
    it 'should raise exeception if there is no param' do
      lambda {
        UserAgentHelper.os_name
    
      }.should.raise Exception
    end  
  end
end