# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'UserAgentParser to Other user_agents strings' do
  
  it 'should be Other, Other and Other' do
    
    user_agent 'Gecko/20100101 Firefox/10.0.1 Fennec/10.0.1'
    should_be 'Other', 'Other', 'Other'

    user_agent 'Gecko/20100101 Firefox/4.0.1 Camino/2.2.1'
    should_be 'Other', 'Other', 'Other'

    user_agent 'Gecko/20100101 Firefox/10.0.1 SeaMonkey/2.7.1'
    should_be 'Other', 'Other', 'Other'
  end
  
end