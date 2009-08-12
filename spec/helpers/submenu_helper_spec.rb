require File.dirname(__FILE__) + "/../spec_helper"

describe "ApplicationHelper" do
  include ApplicationHelper
  dataset :users
  
  it "should include Admin::SubMenuHelper" do
    ApplicationHelper.included_modules.should include(Admin::SubmenuHelper)
  end
  
  it "should respond to links_for_navigation" do
    ApplicationHelper.instance_methods.include?('links_for_navigation').should be_true
  end

  it "should respond to links_for_navigation_without_submenu" do
    ApplicationHelper.instance_methods.include?('links_for_navigation_without_submenu').should be_true
  end
  
  describe "with a tab that has submenu links" do
    before do
      admin = Radiant::AdminUI.instance
      admin.tabs.add("Foo", "bar")
      admin.tabs["Foo"].add_link('sna', 'foo')
      admin.tabs["Foo"].add_link('goodness', 'gracious')
      admin.tabs["Foo"].add_link('jelly', 'fish')
      
      stub!(:current_user).and_return(users(:admin))
      stub!(:current_url?).and_return {|url| url =~ /bar/ }
    end
    
    after do
      admin.tabs.remove("Foo")
    end
    
    it "should add a submenu to the navigation" do
      links_for_navigation.should =~ /<div id="submenu">/
    end

    it "should add the right links to the submenu" do
      links_for_navigation.should =~ /foo/
      links_for_navigation.should =~ /gracious/
      links_for_navigation.should =~ /fish/
    end
  end

end
