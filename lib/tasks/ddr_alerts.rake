namespace :ddr_alerts do

  desc "Create an alert message"
  task :create => :environment do
    puts "ERROR: Must specify message text.  Ex.: MESSAGE='This is an alert message.'" unless ENV['MESSAGE']
    if ENV['MESSAGE']
      active = ENV['ACTIVE'] == 'true' ? true : false
      msg = Ddr::Alerts::Message.new(message: ENV['MESSAGE'], active: active)
      if msg.save
        puts "Created Alert Message"
        msg.reload
        puts msg
      else
        puts "ERROR: Unable to create alert message"
      end
    end
  end

  desc "List alert messages"
  task :list => :environment do
    active = ENV['ACTIVE'] == 'true' ? true : false
    msgs = active ? Ddr::Alerts::Message.active : Ddr::Alerts::Message.all
    msgs.each { |msg| puts msg }
  end

  desc "Activate an alert message"
  task :activate => :environment do
    puts "ERROR: Must specify message ID.  Ex.: MESSAGE_ID=4" unless ENV['MESSAGE_ID']
    if ENV['MESSAGE_ID']
      begin
        msg = Ddr::Alerts::Message.find(ENV['MESSAGE_ID'].to_i)
        if msg.active
          puts "WARNING: Message is already active"
        else
          msg.active = true
          if msg.save
            puts "Message activated"
          else
            puts "ERROR: Unable to activate message"
          end
        end
        msg.reload
        puts msg
      rescue ActiveRecord::RecordNotFound => e
        puts "ERROR: #{e.message}"
      end
    end
  end

  desc "De-activate an alert message"
  task :deactivate => :environment do
    puts "ERROR: Must specify message ID.  Ex.: MESSAGE_ID=4" unless ENV['MESSAGE_ID']
    if ENV['MESSAGE_ID']
      begin
        msg = Ddr::Alerts::Message.find(ENV['MESSAGE_ID'].to_i)
        if !msg.active
          puts "WARNING: Message is not currently active"
        else
          msg.active = false
          if msg.save
            puts "Message deactivated"
          else
            puts "ERROR: Unable to deactivate message"
          end
        end
        msg.reload
        puts msg
      rescue ActiveRecord::RecordNotFound => e
        puts "ERROR: #{e.message}"
      end
    end
  end

  desc "Delete an alert message"
  task :delete => :environment do
    puts "ERROR: Must specify message ID.  Ex.: MESSAGE_ID=4" unless ENV['MESSAGE_ID']
    if ENV['MESSAGE_ID']
      begin
        msg = Ddr::Alerts::Message.find(ENV['MESSAGE_ID'].to_i)
        msg.destroy
        if msg.destroyed?
          puts "Message deleted"
          puts msg
        else
          puts "ERROR: Unable to delete message"
        end
      rescue ActiveRecord::RecordNotFound => e
        puts "ERROR: #{e.message}"
      end
    end
  end

end