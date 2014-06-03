module LittleBird
  class RateLimitError < Exception
    include LittleBirdErrors
    attr_reader :response
  end
end