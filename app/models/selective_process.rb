class SelectiveProcess < ActiveRecord::Base
	has_many  :activity_process

	def get_activities
		@activities = ActivityProcess.where(:SelectiveProcess_id => self.id)
		return @activities
	end
end
