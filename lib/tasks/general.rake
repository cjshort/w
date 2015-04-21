  task :mailcountreset => :environment do
  	User.update_all(mailcount: 0)
  end