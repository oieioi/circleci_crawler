# CircleciCrawler

Crawl CircleCI's the latest artifact file specified.

## Installation

```shell
$ gem install circleci_crawler
```

## Usage

Crawl simplecov.gem result json:

```sh
$ circleci_crawler --project-path="github/your_account_name/your_repository_name" \
                   --api-token=your_circleci_api_token \
                   --path="artifact-file/.last_run.json" | jq
# {
#   "result": {
#      "covered_percent": 83.37
#   }
# }
```

Or 

```ruby
crawler = CircleciCrawler::Crawler.new(
            project_path: 'github/your_account_name/your_repository_name',
            api_token: 'your_circleci_api_token',
            path: 'artifact-file/.last_run.json')
puts crawler.crawl
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
