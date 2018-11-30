module ApplicationHelper
  def current_user
    @current_user
  end

  def user_profile_image(user)
    user.profile_image_url || image_url("default-no-image.jpg")
  end

  def notifications_counter
    @new_notifications_count > 0 ? @new_notifications_count : ""
  end

  def current_user_admin_power
    current_user.is_admin && params[:admin] == "power"
  end

  def human_readable_date(date)
    date.strftime("%d/%b/%Y")
  end

  def human_readable_datetime(date, seconds: true)
    second_indicator = ":%S" if seconds
    date.strftime("%d/%b/%Y %H:%M#{second_indicator}")
  end

  def project_list_filter_class(filter_name=nil)
    return "btn-primary" if params[:filter] == filter_name
    "btn-default"
  end

  def project_list_order_class(order_name=nil)
    return "btn-primary" if params[:order] == order_name
    "btn-default"
  end

  def projects_filters_params
    {filter: params[:filter], order: params[:order], search: params[:search]}.compact
  end

  def markdown(input)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true))
    markdown.render(input).html_safe
  end
end
