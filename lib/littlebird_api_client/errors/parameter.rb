module LittleBird
  class ParameterError < Exception
    include LittleBirdErrors
    attr_reader :response
  end
end