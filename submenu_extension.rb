# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class SubmenuExtension < Radiant::Extension
  version "0.1"
  description "Adds a handy extensible submenu to the radiant admin navigation"
  url "http://spanner.org/radiant/sub_menu"
  
  def activate

    Radiant::AdminUI::Tab.send :include, Admin::TabExtensions
    Radiant::AdminUI.send :include, Admin::SubMenu
    ApplicationHelper.send :include, Admin::SubMenuHelper
    
    # just while I'm testing. you wouldn't really bother.
    admin.tabs['Layouts'].add_link('list', '/admin/layouts')
    admin.tabs['Layouts'].add_link('new', '/admin/layouts/new')
  end
  
  def deactivate
  end
  
end
