class Robot
  @@stored_names = []
  
  def name
    @name ||= create_name
  end
  
  def self.stored_names
    @@stored_names
  end
  
  def reset
    @name = nil
  end
  
  private
  
  def create_name
    letters = ""
    2.times { letters += ('A'..'Z').to_a.sample }
    number = rand(100..1000)
    name = "#{letters}#{number}"
    
    if self.class.stored_names.include?(name)
      create_name
    else
      self.class.stored_names << name
      name
    end
  end
end