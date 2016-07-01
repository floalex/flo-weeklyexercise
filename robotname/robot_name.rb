# class Robot
#   @@stored_names = []
  
#   def name
#     @name ||= create_name
#   end
  
#   def self.stored_names
#     @@stored_names
#   end
  
#   def reset
#     @name = nil
#   end
  
#   private
  
#   def create_name
#     letters = ""
#     2.times { letters += ('A'..'Z').to_a.sample }
#     number = rand(100..1000)
#     name = "#{letters}#{number}"
    
#     if self.class.stored_names.include?(name)
#       create_name
#     else
#       self.class.stored_names << name
#       name
#     end
#   end
# end

# 20160611 live
ALL_ROBOT_NAMES_TAKEN = []

class Robot
  def name
    @name ||= generate_name
  end
  
  def reset
    @name = nil
  end
  
  def generate_name
    name = prefix + numbers
    if ALL_ROBOT_NAMES_TAKEN.include?(name)
      generate_name
    else
      ALL_ROBOT_NAMES_TAKEN << name
      name
    end
  end
  
  def prefix
    rand_char + rand_char
  end
  
  def rand_char
    ('A'..'Z').to_a.sample
  end
  
  def numbers
    "%03d" % (0..999).to_a.sample
  end
end