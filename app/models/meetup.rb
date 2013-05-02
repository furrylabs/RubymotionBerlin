class Meetup < MotionParse::Base
  attribute :title, :when, :address
  
  has_many :talks
end
