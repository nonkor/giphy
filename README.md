# Giphy test project

## Overview

This is a test project that provides basic coverage for some selected giphy features. It's written in Ruby using on Webdriver and Cucumber technologies (for UI tests), RSpec and Airborne technologies (for API tests).

## Getting started

### Installing Ruby
The framework requires Ruby version 2.6.5 or above. The simplest way to manage ruby version is using [rbenv](https://github.com/rbenv/rbenv).

### Installing Webdriver
The framework requires chromedriver ChromeDriver 2.44.609545 or above. The simplest way to install chromedriver. It can be downloaded [here](https://chromedriver.chromium.org/downloads).

### Installing Ruby gems
I recommend to use `bundler` to manage Ruby gems. First of all, you're need to install bundler gem itself:

```
gem install bundler
```
After this, you can use `bundler` to manage all other dependencies for the project:
```
bundler install
```

Now, you are ready to run both type of tests.

## Run cucumber features (UI tests)

To run features, go to the project dir in console and perform:
```
bundle exec cucumber
```

All results are stored under `results` directory. It contains html-report, screenshots and html pages (last two are added only in case of failed tests). Unfortunatelly, screenshots are not embedded in html-report as html reporter in cucumber 4.0 has an [issue](https://github.com/cucumber/cucumber-ruby/issues/1443) with attaching files.

Every new run cleans `results` directory.

## Run rspec tests (API tests)

To run specs, go to the project dir in console and perform:
```
bundle exec rspec
```

## Continuous Integration

All tests are run on CircleCI. They are triggered by commit. See related [project](https://app.circleci.com/pipelines/github/nonkor/giphy/28/workflows/6e3a481b-ce71-4bb7-a566-0ae99b666ebf) for details.

ps: I'm a sweet person
