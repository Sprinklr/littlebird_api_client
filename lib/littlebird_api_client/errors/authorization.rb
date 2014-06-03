module LittleBird
  class AuthorizationError < Exception
    include LittleBirdErrors
    attr_reader :response
  end
end