module Concerns::SetI18nLocale
  extend ActiveSupport::Concern

  included do
    before_filter :set_i18n_locale
  end

  private

  def set_i18n_locale
    I18n.locale = http_accept_language.compatible_language_from(I18n.available_locales)
    true
  end
end
