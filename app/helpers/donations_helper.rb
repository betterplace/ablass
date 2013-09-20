module DonationsHelper

  def facebook_share_url
    # todo: this should be configured somewhere:
    ablass_domain = 'http://www.ablass-app.de'
    fb_base = "https://www.facebook.com/sharer/sharer.php?"
    url_param = "u=#{CGI::escape(ablass_domain)}"
    fb_base + url_param
  end

end
