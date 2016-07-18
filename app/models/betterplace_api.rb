require 'open-uri'

class BetterplaceApi
  def get(query, locale: I18n.locale, params: {})
    query = query.sub(/(\.json)?\z/, '.json')
    params.present? and query += "?#{params.to_param}"
    api_url = Rails.configuration.betterplace_api.(query, locale: I18n.locale)
    Rails.logger.info "Requesting #{api_url.to_s.inspect}."
    begin
      open(api_url, open_timeout: 10.seconds, read_timeout: 10.seconds) { |api|
        JSON.parse(api.read, object_class: JSON::GenericObject)
      }
    rescue => e
      e.message << " (#{api_url})"
      Rails.logger.error e
      raise e
    end
  end
end
