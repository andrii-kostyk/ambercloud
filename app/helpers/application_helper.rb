module ApplicationHelper
  def active_channel?(path)
    'active' if current_page?(path) || current_page?(root_path)
  end
end
