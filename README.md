# [![Ruby Gem Icon](https://raw.githubusercontent.com/zenkay/machinereading-ruby/master/rubygem.png)](https://rubygems.org/gems/machinereading) MachineReading Ruby Gem

[![Code Climate](https://codeclimate.com/github/zenkay/machinereading-ruby/badges/gpa.svg)](https://codeclimate.com/github/zenkay/machinereading-ruby) [![Travis CI](https://travis-ci.org/zenkay/machinereading-ruby.svg?branch=master)](https://travis-ci.org/zenkay/machinereading-ruby) [![Gem Version](https://badge.fury.io/rb/machinereading.svg)](http://badge.fury.io/rb/machinereading)

Ruby gem for interaction with Damantic's [Machinereading](http://www.machinereading.com) APIs.

## Installation

Add this line to your application's Gemfile:

```
gem 'machinereading'
```

And then execute:

```
$ bundle install
```

## Setup

Setup configuration parameters

```
Machinereading.configure do |c|
  c.api_key = "your-api-key-from-machine-reading-account"
  c.endpoint = "http://www.machinereading.com"
end
```

## Usage


```
element = Machinereading::Element.new("Questo è un testo di esempio", "it")
response = element.tokenizer
```

```
element = Machinereading::Element.new("Questo è un testo di esempio", "it")
response = element.pos_tagger_stanford # default is "vertical""
response = element.pos_tagger_stanford("horizontal")
```

```
element = Machinereading::Element.new("Questo è un testo di esempio", "it")
response = element.syntactic_parser_stanford
```

```
element = Machinereading::Element.new("Questo è un testo di esempio", "it")
response = element.lemmatizer
```

```
element = Machinereading::Element.new("Questo è un testo di esempio", "it")
response = element.sequence_surprisal
```

```
element = Machinereading::Element.new("Questo è un testo di esempio", nil)
response = element.language_detector
```

```
element = Machinereading::Element.new("Questo è un testo di esempio", "it")
response = element.keyword_extractor # default is 15
response = element.keyword_extractor(50)
```

```
element = Machinereading::Element.new("Questo è un testo di esempio", "it")
response = element.automatic_categorization
```

```
element = Machinereading::Element.new("Questo è un testo di esempio", "it")
response = element.voice_tags
```



