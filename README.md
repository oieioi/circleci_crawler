# CircleciCrawler

Crawl CircleCI's the latest artifact file specified.

## Installation

    $ gem install circleci_crawler

## Usage

Crawl simplecov.gem result:

    $ circleci_crawler --project-path="github/your_account_name/your_repositry_name" --api-token=your_circleci_api_token --path="artifact-file/.last_run.json"|jq
    # {
    #   "result": {
    #      "covered_percent": 83.37
    #   }
    # }


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
