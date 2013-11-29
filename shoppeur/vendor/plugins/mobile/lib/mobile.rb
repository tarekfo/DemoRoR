# Mobile
module Mobile
  def self.included(base)
    base.before_filter :adjust_format_for_mobile
  end

  def iphone_user_agent?
    request.env["HTTP_USER_AGENT"] && request.env["HTTP_USER_AGENT"][/(Mobile\/.+Safari)/]
  end

  def adjust_format_for_mobile
    request.format = :iphone if iphone_user_agent?
  end  
end