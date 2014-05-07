require 'spec_helper'

vcr_options = { :cassette_name => "machinereading_element", :record => :new_episodes }

describe Machinereading::Element, vcr: vcr_options do
  
  before(:all) do
    Machinereading.configure do |c|
      c.api_key = "uf8t28vY4U6w0cU7269O0zORI4h5yz7uhfzBmvBUPJeSVlvmJE" # a.mostosi@thefool.it
      c.endpoint = "http://www.machinereading.com"
    end
    @sample_content = "Mio padre che mi spinge a mangiare e guai se non finisco mio padre che vuol farmi guidare mi frena con il fischio il bambino più grande mi mena davanti a tutti gli altri lui che passa per caso mi salva e mi condanna per sempre mio padre di spalle sul piatto si mangia la vita e poi sulla pista da ballo fa un valzer dentro il suo nuovo vestito  Per sempre solo per sempre cosa sarà mai porvarvi dentro solo tutto il tempo per sempre solo per sempre c'è un istante che rimane lì piantato eternamente E lei che non si lascia afferrare si piega indietro e ride e lei che dice quanto mi ama e io che mi fido e lei che mi toccava per prima la sua mano bambina vuole che le giuri qualcosa le si gonfia una vena e lei che era troppo più forte sicura di tutto e prima di andarsene mi dà il profilo con un movimento perfetto Per sempre solo per sempre cosa sarà mai portarvi dentro solo tutto il tempo per sempre solo per sempre c'è un istante che rimane lì piantato eternamente per sempre solo per sempre Mia madre che prepara la cena cantando sanremo carezza la testa a mio padre gli dice vedrai che ce la faremo Per sempre solo per sempre cosa sarà mai portarvi dentro solo tutto il tempo per sempre solo per sempre c'è un istante che rimane lì piantato eternamente per sempre solo per sempre"
    @sample_content_lang = "it"
  end

  it "initialize a new element" do
    element = Machinereading::Element.new(@sample_content, @sample_content_lang)
    expect(element).to be_an_instance_of(Machinereading::Element)
    expect(element.text).not_to be_nil
    expect(element.text).to eq(@sample_content)
    expect(element.lang).not_to be_nil
    expect(element.lang).to eq(@sample_content_lang)
  end

  it "make a request to 'tokenizer'" do
    element = Machinereading::Element.new(@sample_content, @sample_content_lang)
    response = element.tokenizer
    expect(response).not_to be_empty
  end

  it "make a request to 'pos_tagger_stanford'" do
    element = Machinereading::Element.new(@sample_content, @sample_content_lang)
    response = element.pos_tagger_stanford
    expect(response).not_to be_empty
  end

  it "make a request to 'pos_tagger_stanford' with additional params" do
    element = Machinereading::Element.new(@sample_content, @sample_content_lang)
    response = element.pos_tagger_stanford("horizontal")
    expect(response).not_to be_empty
  end

  it "make a request to 'syntactic_parser_stanford'" do
    element = Machinereading::Element.new(@sample_content, @sample_content_lang)
    response = element.syntactic_parser_stanford
    expect(response).not_to be_empty
  end

  it "make a request to 'lemmatizer'" do
    element = Machinereading::Element.new(@sample_content, @sample_content_lang)
    response = element.lemmatizer
    expect(response).to be_an_instance_of(Array)
  end

  it "make a request to 'sequence_surprisal'" do
    element = Machinereading::Element.new(@sample_content, @sample_content_lang)
    response = element.sequence_surprisal
    expect(response).to be_an_instance_of(Array)
    response.each do |r|
      expect(r["SEQUENCE"]).to be_an_instance_of(Array)
    end
  end

  it "make a request to 'language_detector'" do
    element = Machinereading::Element.new(@sample_content, nil)
    response = element.language_detector
    expect(response).to be_an_instance_of(Hash)
    expect(response["detected_languages"]).to be_an_instance_of(Array)
    response["detected_languages"].each do |r|
      expect(r["label"]).not_to be_nil
      expect(r["score"]).not_to be_nil
    end
  end

  it "make a request to 'keyword_extractor'" do
    element = Machinereading::Element.new(@sample_content, @sample_content_lang)
    response = element.keyword_extractor
    expect(response).to be_an_instance_of(Array)
    response.each do |r|
      expect(r["rating"]).not_to be_nil
      expect(r["keyword"]).not_to be_nil
    end
  end

  it "make a request to 'keyword_extractor'" do
    element = Machinereading::Element.new(@sample_content, @sample_content_lang)
    response = element.keyword_extractor(50)
    expect(response).to be_an_instance_of(Array)
    response.each do |r|
      expect(r["rating"]).not_to be_nil
      expect(r["keyword"]).not_to be_nil
    end
  end

  it "make a request to 'automatic_categorization'" do
    element = Machinereading::Element.new(@sample_content, @sample_content_lang)
    response = element.automatic_categorization
    expect(response).to be_an_instance_of(Hash)
    expect(response["categories"]).to be_an_instance_of(Array)
    expect(response["keywords"]).to be_an_instance_of(Array)
    response["keywords"].each do |r|
      expect(r["occ"]).not_to be_nil
      expect(r["keyword"]).not_to be_nil
    end
  end

  it "make a request to 'voice_tags'" do
    element = Machinereading::Element.new(@sample_content, @sample_content_lang)
    response = element.voice_tags
    expect(response).to be_an_instance_of(Hash)
    expect(response["positive_words"]).to be_an_instance_of(Array)
    expect(response["negative_words"]).to be_an_instance_of(Array)
    expect(response["voice_tags"]).to be_an_instance_of(Hash)
  end

end