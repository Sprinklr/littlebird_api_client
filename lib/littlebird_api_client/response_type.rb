module LittleBird
  class ResponseType
    def initialize(attrs)
      attrs.each do |key, value|
        self.instance_eval { class << self; self end }.send(:attr_accessor, key.to_sym)
        self.send(key+"=", parse_value(key, value))
      end
      self
    end
  
    def parse_value(key, value)
      set_as_time_if_timestamp(key, value)
    end

    def set_as_time_if_timestamp(key, value)
      self.class.timestamped_keys.include?(key)  && !value.nil? ? Time.parse(value) : value
    end
  
    def self.timestamped_keys
      ["created_at", "started_at", "updated_at", "finished_at"]
    end

    def to_json(*a)
      {
        'json_class'   => self.class.name,
        'data'         => attributes
      }.to_json(*a)
    end
  
    def attributes
      Hash[useful_attribute_names.zip(useful_attribute_names.map{|attribute| self.send(attribute)})]
    end
  
    def attribute_names
      instance_variables.collect{|ivar| ivar.to_s.gsub("@", "")}
    end
  
    def useful_attribute_names
      attribute_names-["client"]
    end
  end
end