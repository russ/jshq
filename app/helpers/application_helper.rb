module ApplicationHelper
  
  def display_flash
    [:notice, :success, :error, :warning, :alert].each do |msg|
      return content_tag(:div, flash[msg], :id => "flash", :class => "flash_#{msg}") if flash[msg]
    end unless flash.empty?
  end
  
end
