class MeetupsViewController < UITableViewController
  attr_accessor :meetups
  
  def init
    @meetups = []
    super
  end
  
  def viewDidLoad
    self.title = "Meetups"

    load_data
    
    super
  end
  
  def tableView(tableView, numberOfRowsInSection:section)
    @meetups.size
  end
  
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    fresh_cell.tap do |cell|
      meetup = @meetups[indexPath.row]
      cell.textLabel.text = meetup.address
      cell.detailTextLabel.text = meetup.when
    end
  end
  
  def load_data
    Reachability.when_reachable do
      SVProgressHUD.showWithMaskType(SVProgressHUDMaskTypeClear)
      Meetup.find_all do |results, response|
        SVProgressHUD.dismiss
        if response.ok? && results
          @meetups = results
        else
          Reachability.offline_alert
        end
        tableView.reloadData
      end
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
