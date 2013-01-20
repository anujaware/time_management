class Appointment < ActiveRecord::Base
  attr_accessible :s_date, :s_time, :scheduled_at

  scope :from_date,lambda{|year, month,day| where('scheduled_at >= ?', Time.parse("#{year}-#{month}-#{day} 00:00:00 UTC"))}
  scope :to_date,lambda{|year, month,day| where('scheduled_at < ?',  Time.parse("#{year}-#{month}-#{day} 00:00:00 UTC"))}

end
