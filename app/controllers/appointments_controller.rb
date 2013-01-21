class AppointmentsController < ApplicationController
	before_filter :settimezone
	before_filter :collect_data

	def manage
		@schedules = Appointment.from_date(2013, 01, 18).to_date(2013, 01, 19)
	end

	def add
		if request.post?
			Appointment.create(:scheduled_at => params[:scheduled_at].first)		
		end
	end

	def settimezone
		#Time.zone = current_user.time_zone || "UTC" 
	end

	def index
		@schedules = Appointment.all
		render :action => :manage
	end

	def index_tz
		Time.zone = Time.find_zone('Midway Island')
		@schedules = Appointment.all
		render :action => :manage
	end

	def user_tz
		Time.zone = (['PST', 'CST'].include?(Time.now.zone) ?  'Pacific Time (US & Canada)' : Time.now.zone)
		@schedules = Appointment.all
		render :action => :manage
	end

	def change_tz
		Time.zone = params['time_zone']
		p Time.zone
		@schedules = Appointment.all
		render :action => :manage
	end

	private

	def collect_data
		@all_zones = ActiveSupport::TimeZone.all.collect{|tz| sp = "#{tz}".split(')'); [tz, sp.last.strip]}
	end
end
