  task :checkers => [:firstvisit] do
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