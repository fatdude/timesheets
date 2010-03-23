ActiveRecord::Base.logger = Logger.new(STDOUT)
#ActionView::Base.field_error_proc = Proc.new{ |html_tag, instance| "<span class=\"field_with_errors\">#{html_tag}</span>" }

