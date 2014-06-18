module LittleBird
  module Response
    def error(response)
      {
        authorization: AuthorizationError.new(response),
        internal: InternalError.new(response),
        parameter: ParameterError.new(response),
        rate_limit: RateLimitError.new(response)
      }[response["error_type"].to_sym]
    end

    def response_is_an_error(response)
      response.class == Hash && !response["error"].nil?
    end

    def interpret(response, cast_class)
      binding.pry
      raise error(response), response["error"] if response_is_an_error(response)
      if cast_class.class == Array
        return iterate(response, cast_class.first)
      else
        return respond_as_class(response, cast_class)
      end
    end

    def iterate(response, cast_class)
      response.map do |response_obj|
        respond_as_class(response_obj, cast_class)
      end
    end

    def set_client(object)
      object.instance_eval { class << self; self end }.send(:attr_accessor, :client)
      object.client = self
    end

    def respond_as_class(response_obj, cast_class)
      object = cast_class.new(response_obj)
      set_client(object)
      object
    end
  end
end

# load 'little_bird.rb'
# client = LittleBird::Client.new("533c98700765e035b1000001", 1, "0.0.0.0:8083")
# graph = client.graph_list.first