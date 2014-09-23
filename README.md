# Machinereading

Ruby gem for interaction with [Machinereading.com](http://www.machinereading.com)

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



