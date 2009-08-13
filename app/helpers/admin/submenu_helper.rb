module Admin::SubmenuHelper

  def self.included(base)
    base.class_eval do

      def links_for_navigation_with_submenu
        links_for_navigation_without_submenu + navigation_submenu
      end
      alias_method_chain :links_for_navigation, :submenu

      def navigation_submenu
        links = []
        current_tab = admin.tabs.find{ |tab| current_url?(File.join(ActionController::Base.relative_url_root || '', tab.url)) }
        if current_tab && current_tab.has_submenu?
          current_tab.submenu.each do |link| 
            links << nav_link_to(link.name, File.join(ActionController::Base.relative_url_root || '', link.url))
          end
          %{<div id="submenu"><div>#{links.join(separator)}</div></div>}
        else
          %{<div id="submenu" class="empty"></div>}
        end
      end

    end
  end

  
end