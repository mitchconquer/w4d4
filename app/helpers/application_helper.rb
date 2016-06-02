module ApplicationHelper

  def form_auth_field
    %Q(<input type="hidden" value="#{form_authenticity_token}" name="authenticity_token" />).html_safe
  end

  def logged_in?
    !!current_user
  end

end
