# [![Ruby Gem Icon](https://raw.githubusercontent.com/zenkay/machinereading-ruby/master/rubygem.png)](https://rubygems.org/gems/machinereading) MachineReading Ruby Gem

[![Code Climate](https://codeclimate.com/github/zenkay/machinereading-ruby/badges/gpa.svg)](https://codeclimate.com/github/zenkay/machinereading-ruby) [![Travis CI](https://travis-ci.org/zenkay/machinereading-ruby.svg?branch=master)](https://travis-ci.org/zenkay/machinereading-ruby) [![Gem Version](https://badge.fury.io/rb/machinereading.svg)](http://badge.fury.io/rb/machinereading) [![Coverage Status](https://coveralls.io/repos/zenkay/machinereading-ruby/badge.png?branch=master)](https://coveralls.io/r/zenkay/machinereading-ruby?branch=master)

Ruby gem for interaction with Damantic's [MachineReading](http://www.machinereading.com) APIs.

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

_Methods references are taken from [Machine Reading documentation](http://www.machinereading.com/documentation)._

**Tokenizer**: divides text into a sequence of sentences and tokens, which roughly correspond to "words".

```
element = Machinereading::Element.new("Questo è un testo di esempio", "it")
response = element.tokenizer
```

**Pos Tagger Stanford**: assigns a part of speech (POS) tags to each word of the input text. Tags are mostly language independent following the Penn Treebank tag set.

```
element = Machinereading::Element.new("Questo è un testo di esempio", "it")
response = element.pos_tagger_stanford # default is "vertical""
response = element.pos_tagger_stanford("horizontal")
```

**Syntactic Parser Stanford**: takes natural language sentences in input and returns a full dependency tree describing its syntactic structure. The grammatical relations are mostly language independent.

```
element = Machinereading::Element.new("Questo è un testo di esempio", "it")
response = element.syntactic_parser_stanford
```

**Lemmatizer**: is used to parse the input text and provides the lemmas for each word.

```
element = Machinereading::Element.new("Questo è un testo di esempio", "it")
response = element.lemmatizer
```

**Sequence Surprisal**: assigns a "surprisal value" (probabilities range from 0 to 1) to each word and each sentence of the input text. Surprisal captures a range of sentence processing effects like syntactic difficulties.

```
element = Machinereading::Element.new("Questo è un testo di esempio", "it")
response = element.sequence_surprisal
```

**Language Detector**: determines the language that any text content was written in.

```
element = Machinereading::Element.new("Questo è un testo di esempio", nil)
response = element.language_detector
```

**Keyword Extractor**: analyzes the input text and extracts the most important words and phrases (proper nouns and common nouns).

```
element = Machinereading::Element.new("Questo è un testo di esempio", "it")
response = element.keyword_extractor # default is 15
response = element.keyword_extractor(50)
```

**Automatic Categorization**: auto-categorizes and organizes huge sets of text into relevant categories (IPTC) based on automatically detected themes and content.

```
element = Machinereading::Element.new("Questo è un testo di esempio", "it")
response = element.automatic_categorization
```

**Voice Tags**: extracts additional information about the meaning of the text. It can be identifies when there are values in the text as "adversative", "hypothesis", "reason or cause". Voice Tags also extracts positive and negative words of the input text as a starting point for building your own sentiment analysis system.

```
element = Machinereading::Element.new("Questo è un testo di esempio", "it")
response = element.voice_tags
```



