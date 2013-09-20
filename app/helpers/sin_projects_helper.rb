module SinProjectsHelper
  def betterplace_platform_url(sin_project, lang: 'en')
    sin_project.betterplace_id.full? do |id|
      URI.parse(
        "http://#{Rails.configuration.betterplace_platform_host}/#{lang}/projects/%u" % id
      )
    end
  end
end
