require "faraday"
require "faraday_middleware"
require "json"

module Machinereading
    class Element

    attr_accessor :text, :lang

    def initialize(input_text, input_lang)
      @text = input_text
      @lang = input_lang
    end

    def tokenizer
      call("tokenizer", text: self.text, lang: self.lang)
    end

    def pos_tagger_stanford(format = "vertical")
      call("pos_tagger_stanford", text: self.text, lang: self.lang, format: format)
    end

    def syntactic_parser_stanford
      call("syntactic_parser_stanford", text: self.text, lang: self.lang)
    end

    def lemmatizer
      # replace "/" with " " to avoid problem during response split
      call("lemmatizer", text: self.text.gsub("/", " "), lang: self.lang).split("/")
    end

    def sequence_surprisal
      JSON.parse call("sequence_surprisal", text: self.text, lang: self.lang)
    end

    def language_detector
      JSON.parse call("language_detector", text: self.text)
    end

    def keyword_extractor(maxRetrieve = 15)
      JSON.parse call("keyword_extractor", text: self.text, lang: self.lang, maxRetrieve: maxRetrieve)
    end

    def automatic_categorization
      JSON.parse call("automatic_categorization", text: self.text, lang: self.lang)
    end

    def voice_tags
      JSON.parse call("voice_tags", text: self.text, lang: self.lang)
    end

    protected

    def call(endpoint, params)
      begin
        params = params.merge({api_key: Machinereading.config.api_key})
        conn = Faraday.new(url: Machinereading.config.endpoint) do |faraday|
          faraday.request  :url_encoded
          # faraday.response :json, :content_type => /\bjson$/
          faraday.adapter  Faraday.default_adapter
        end
        response = conn.post "/#{endpoint}", params
        response.body
      rescue Exception => e
        raise Machinereading::BadResponse
      end
    end

  end

end