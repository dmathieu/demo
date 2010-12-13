module ApplicationHelper
  
  def error_for(field, object)
    content_tag('div', object.errors[field], :class => "error #{object.class.to_s}") if object.errors[field]
  end
end