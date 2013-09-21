module DonationsHelper

  def facebook_share_url
    ablass_domain = "http://#{Rails.configuration.platform_host}"
    fb_base = "https://www.facebook.com/sharer/sharer.php?"
    url_param = "u=#{CGI::escape(ablass_domain)}"
    fb_base + url_param
  end

end
