class ComicsParser
    def initialize(raw_response)
      @raw_response = raw_response
    end
  
    def comics
      parsed_json['data']['results'].map { |attributes| Comic.new(attributes) }
    end
  
    private
  
    def parsed_json
      @parsed_json ||= JSON.parse(@raw_response)
    end
  end