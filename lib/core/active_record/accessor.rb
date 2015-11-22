module Accessor
  def accessor(*args)
    args.each do |arg|
      # getter
      self.class_eval("def #{arg}; @#{arg}; end")
      # setter
      self.class_eval("def #{arg}=(val); @#{arg}=val; end")
    end
  end

  def reader(*args)
    args.each do |arg|
      self.class_eval("def #{arg}; @#{arg}; end")
    end
  end

  def writer(*args)
    args.each do |arg|
      self.class_eval("def #{arg}=(val); @#{arg}=val; end")
    end
  end
end