class Appointment < ActiveRecord::Base
  attr_accessible :s_date, :s_time, :scheduled_at

  scope :from_date,lambda{|year, month,day| where('scheduled_at >= ?', Time.parse("#{year}-#{month}-#{day} 00:00:00 UTC"))}
  scope :to_date,lambda{|year, month,day| where('scheduled_at < ?',  Time.parse("#{year}-#{month}-#{day} 00:00:00 UTC"))}
  scope :from_date_2,lambda{|year, month,day| where('scheduled_at >= ?', Time.parse('2013-01-18').beginning_of_day)}
  scope :to_date_2,lambda{|year, month,day| where('scheduled_at < ?',  Time.parse('2013-01-18').beginning_of_day)}

end
