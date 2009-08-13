# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class SubmenuExtension < Radiant::Extension
  version "0.1"
  description "Adds handy submenus to tabs in the radiant admin navigation"
  url "http://spanner.org/radiant/submenu"
  
  def activate

    Radiant::AdminUI::Tab.send :include, Admin::TabExtensions
    Radiant::AdminUI.send :include, Admin::Submenu
    ApplicationHelper.send :include, Admin::SubmenuHelper
    Admin::ResourceController.send :include, Admin::ResourceControllerExtensions

  end
  
  def deactivate
  end
  
end
