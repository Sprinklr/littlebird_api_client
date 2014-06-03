module LittleBird
  class Download < ResponseType
    def to_file(file=StringIO.new)
      file.write(self.result)
      file.rewind
      file
    end
  end
end