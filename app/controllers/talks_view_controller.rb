class TalksViewController < UITableViewController
  attr_accessor :meetup, :talks
  
  def initWithMeetup(meetup)
    self.title = "Talks"
    
    @meetup = meetup
    @talks = []
    init
  end
  
  def viewDidLoad
    load_data
    
    super
  end
  
  def tableView(tableView, numberOfRowsInSection:section)
    @talks.size
  end
  
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    fresh_cell.tap do |cell|
      talk = @talks[indexPath.row]
      cell.textLabel.text = talk.title
      cell.detailTextLabel.text = talk.text
    end
  end
  
  def load_data
    SVProgressHUD.showWithMaskType(SVProgressHUDMaskTypeClear)
    @meetup.talks do |results, error|
      SVProgressHUD.dismiss
      @talks = results
      tableView.reloadData
    end
  end
  
private
  def fresh_cell
    tableView.dequeueReusableCellWithIdentifier('Cell') ||
    UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:'Cell')
  end
end
