# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
TimeManagement::Application.initialize!

Time::DATE_FORMATS.merge!(
	:default => '%H:%M',
	:date_time12  => "%m/%d/%Y %I:%M%p",
	:date_time24  => "%m/%d/%Y %H:%M",
)

Date::DATE_FORMATS.merge!(
	:default => '%m/%d/%Y',
	:date_time12  => "%m/%d/%Y %I:%M%p",
	:date_time24  => "%m/%d/%Y %H:%M",
)
