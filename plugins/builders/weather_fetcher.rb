class Builders::WeatherFetcher < SiteBuilder
  def build
    helper :fetch_weather_forecast do |additional_flags|
      response = fetch("https://wttr.in/Smyrna+Georgia?1QFTA#{additional_flags}")

      response.body
    end
  end

  def fetch(url)
    uri = URI.parse(url)
    request = Net::HTTP::Get.new(uri)
    request.content_type = "text/plain"
    request["User-Agent"] = "curl"

    req_options = {
      use_ssl: uri.scheme == "https"
    }

    Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
  end
end
