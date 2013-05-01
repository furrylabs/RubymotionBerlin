class Meetup
  include ParseModel::Model
  
  fields :title, :when, :address
  
  def talks(&block)
    Talk.query.whereKey("meetup_id", equalTo:self.PFObject).find(&block)
  end
end
