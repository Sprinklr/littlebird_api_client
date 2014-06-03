module LittleBird
  class InternalError < StandardError
    include LittleBirdErrors
    attr_reader :response
  end
end