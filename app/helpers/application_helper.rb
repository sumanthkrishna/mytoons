module ApplicationHelper
  def after_sign_in_path_for(resource)
    #    raise current_user.inspect
    sign_in_url = url_for(:action => 'new', :controller => 'sessions', :only_path => false, :protocol => 'http')
    sign_up_url = url_for(:action => 'new', :controller => 'registrations', :only_path => false, :protocol => 'http')
    if (request.referer == sign_in_url)
    super
    elsif (request.referer == sign_up_url)
      root_path
    else
      if  current_user.has_role? :Moderator
        dashboard_moderator_url
      elsif current_user.has_role? :Publisher
        dashboard_publisher_url
      elsif current_user.has_role? :SystemAdmin
        #        raise current_user.inspect
        dashboard_systemadmin_url

      elsif current_user.has_role? :User
        request.referer || stored_location_for(resource) || root_path
      else
        request.referer || stored_location_for(resource) || root_path
      end
    end
  end

  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : ''
    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end

end
