class MeetupsViewController < UITableViewController
  attr_accessor :meetups
  
  def init
    self.title = "Meetups"
    
    @meetups = []
    super
  end
  
  def viewDidLoad
    load_data
    
    super
  end
  
  def tableView(tableView, numberOfRowsInSection:section)
    @meetups.size
  end
  
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    fresh_cell.tap do |cell|
      meetup = @meetups[indexPath.row]
      cell.textLabel.text = meetup.title
      cell.detailTextLabel.text = "#{meetup.address} - #{meetup.when.to_date.to_s}"
    end
  end
  
  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    navigationController.pushViewController(TalksViewController.alloc.initWithMeetup(@meetups[indexPath.row]), animated:true)
  end
  
  def load_data
    SVProgressHUD.showWithMaskType(SVProgressHUDMaskTypeClear)
    Meetup.all do |results, error|
      SVProgressHUD.dismiss
      @meetups = results
      tableView.reloadData
    end
  end
  
private
  def fresh_cell
    tableView.dequeueReusableCellWithIdentifier('Cell') ||
    UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:'Cell').tap do |cell|
      cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
    end
  end
end
