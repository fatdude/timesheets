module ApplicationHelper
  def growl escape=true
    message = flash.delete_if { |k, v| v.nil? }
    case message.keys.first
      when :error
        text = "<div class=\"jgrowl_error\">#{flash[:error]}</div>"
      when :info
        text = "<div class=\"jgrowl_info\">#{flash[:info]}</div>"
      when :notice
        text = "<div class=\"jgrowl_notice\">#{flash[:notice]}</div>"
    end

    if escape
      escape_javascript text
    else
      text
    end
  end
end

