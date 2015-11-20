class Feedback < ActiveRecord::Base

	belongs_to :activity_process
	has_one :user

end
