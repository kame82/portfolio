module ApplicationHelper
  def flash_background_color(type)
    case type.to_sym
    when :notice then 'bg-teal-100 border-teal-500 text-teal-900'
    when :alert then 'bg-red-100 border-red-400 text-red-700'
    when :error then 'bg-orange-100 border-orange-500 text-orange-700'
    else 'bg-gray-500'
    end
  end
end
