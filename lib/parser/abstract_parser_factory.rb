module AbstractParserFactory
  def loader
    raise NotImplementedError, "This is an abstract module"
  end
end
