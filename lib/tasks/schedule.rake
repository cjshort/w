  task :checkers => [:firstvisit, :lastvisit, :fifthvisit, :tenthvisit] do
  end

  task :firstvisit => :environment do
  	User.all.each do |user|
			Schedule.where(:mode => 1, :user_id => user.id, :status => true).each do |schedule|
				humans = user.humans.where("? <= created_at AND created_at <= ?", schedule.value.days.ago.beginning_of_day, schedule.value.days.ago.end_of_day)
				if humans.count > 0
					PanelMailer.schedule(user, humans, schedule).deliver
				end
			end
  	end
  end

  task :lastvisit => :environment do
  	User.all.each do |user|
			Schedule.where(:mode => 2, :user_id => user.id, :status => true).each do |schedule|
        user.humans.each do |human|
          if human.human_logins.last.created_at.to_date == schedule.value.days.ago.to_date
              PanelMailer.schedule(user, human, schedule).deliver
          end
        end
			end
  	end
  end

  task :fifthvisit => :environment do
    User.all.each do |user|
      Schedule.where(:mode => 2, :user_id => user.id, :status => true).each do |schedule|
        user.humans.each do |human|
          if human.human_logins.last.created_at.to_date == schedule.value.days.ago.to_date && human.human_logins.count == 5
              PanelMailer.schedule(user, human, schedule).deliver
          end
        end
      end
    end
  end

  task :tenthvisit => :environment do
    User.all.each do |user|
      Schedule.where(:mode => 2, :user_id => user.id, :status => true).each do |schedule|
        user.humans.each do |human|
          if human.human_logins.last.created_at.to_date == schedule.value.days.ago.to_date && human.human_logins.count == 10
              PanelMailer.schedule(user, human, schedule).deliver
          end
        end
      end
    end
  end