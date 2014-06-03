module LittleBird
  class CompareResult < ResponseType
    def initialize(data)
      result = {}
      data.each do |relation_type, user_data|
        result[relation_type] = user_data.values.collect{|u| User.new(u)}
      end
      super(result)
    end
  end
end