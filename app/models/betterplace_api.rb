require 'open-uri'

class BetterplaceApi
  def get(query, locale: I18n.locale, params: {})
    query = query.sub(/(\.json)?\z/, '.json')
    params.present? and query += "?#{params.to_param}"
    api_url = Rails.configuration.betterplace_api.(query, locale: I18n.locale)
    Rails.logger.info "Requesting #{api_url.to_s.inspect}."
    begin
      JSON.parse(open(api_url).read, object_class: JSON::GenericObject)
    rescue => e
      e.message << " (#{api_url})"
      Rails.logger.error e
      raise e
    end
  end
end
