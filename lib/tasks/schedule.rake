  task :checkers => [:firstvisit, :fifthvisit] do
  end

  task :firstvisit => :environment do
  	User.all.each do |user|
			Schedule.where(:mode => 1, :user_id => user.id).each do |schedule|
				humans = user.humans.where("? <= created_at AND created_at <= ?", schedule.value.days.ago.beginning_of_day, schedule.value.days.ago.end_of_day)
				if humans.count > 0
					PanelMailer.schedule(user, humans, schedule).deliver
				end
			end
  	end
  end

  task :lastvisit => :environment do
  	User.all.each do |user|
			Schedule.where(:mode => 2, :user_id => user.id).each do |schedule|
				#humans = user.humans
				#if humans.count > 0
				#	PanelMailer.schedule(user, humans, schedule).deliver
				#end
			end
  	end
  end

  task :fifthvisit => :environment do
  	User.all.each do |user|
			Schedule.where(:mode => 3, :user_id => user.id).each do |schedule|
        humans = user.humans.joins(:human_logins).where(human_logins_count: 5).group('humans.id').having('MAX(human_logins.created_at) >= ?', Date.today)
        if humans.count.length > 0
          PanelMailer.schedule(user, humans, schedule).deliver
        end
			end
  	end
  end


   task :tenthvisit => :environment do
  	User.all.each do |user|
			Schedule.where(:mode => 4, :user_id => user.id).each do |schedule|
			end
  	end
  end