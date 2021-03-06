class AppointmentsController < ApplicationController
	before_filter :settimezone
	before_filter :collect_data

	def manage
		Time.zone = 'Kolkata'
		@schedules = Appointment.from_date(2013, 01, 18).to_date(2013, 01, 19)
	end
	def manage_2
		Time.zone = 'Kolkata'
		@schedules = Appointment.from_date_2(2013, 01, 18).to_date_2(2013, 01, 19)
		render :action => :manage
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
		Time.zone = Time.current.zone
		@schedules = Appointment.all
		render :action => :manage
	end

	def change_tz
		Time.zone = params['time_zone']
		@schedules = Appointment.all
		render :action => :manage
	end

	private

	def collect_data
		@all_zones = ActiveSupport::TimeZone.all.collect{|tz| sp = "#{tz}".split(')'); [tz, sp.last.strip]}.sort_by!{| obj | obj.last }
	end
end
