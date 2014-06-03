module LittleBird
  module Request;end
  module Response;end
  class Client
    include Request
    include Response
    def initialize(api_key, version=1, base_url="api.getlittlebird.com")
      @api_key = api_key
      @version = :"v#{version}"
      @base_url = base_url
    end
    
    def graphs
      self.graph_list
    end
    
    def create_graph(term)
      self.graph_create(term)
    end
  end
end