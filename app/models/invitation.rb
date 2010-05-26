class Invitation < ActiveRecord::Base
  belongs_to :user
  belongs_to :invited_user, :class_name => "User"
  
  
  def initialize_code
    self.code = "sclc-" + strand(6)
  end
  
  private

  # An Array with ambiguous characters removed: i, l, o, 0, 1
  CHARS = [('a'..'z').to_a, ('0'..'9').to_a].flatten - %w[i l o 0 1]

  def strand(len, str='')
     str << CHARS[rand(CHARS.size-1)]
     str.size == len ? str : strand(len, str)
  end
end
