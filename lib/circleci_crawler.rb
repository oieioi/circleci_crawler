require "circleci_crawler/version"
require 'net/https'
require 'json'

module CircleciCrawler
  class Crawler

    def initialize(api_token:, project_path:, path:)
      @api_token = api_token
      @project_path = project_path
      @path = path
    end

    def crawl
      results = request("https://circleci.com/api/v1.1/project/#{@project_path}/latest/artifacts?circle-token=#{@api_token}")
      target = results.find { |result| result[:path] == @path }

      request("#{target[:url]}?circle-token=#{@api_token}", should_parse_to_json: false)
    end

    private

    def request(url, should_parse_to_json: true)
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == 'https'
      req = Net::HTTP::Get.new(uri.to_s)
      res = http.request(req)

      raise "Failed to fetch #{uri}" unless res.is_a?(Net::HTTPSuccess)

      if should_parse_to_json
        JSON.parse(res.body, symbolize_names: true)
      else
        res.body
      end
    end
  end
end
