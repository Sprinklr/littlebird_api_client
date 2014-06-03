module LittleBird
  module LittleBirdErrors

    def initialize(response)
      @response = response
    end

    def message
      @response.error+"\n"+@response.inspect
    end

  end
end