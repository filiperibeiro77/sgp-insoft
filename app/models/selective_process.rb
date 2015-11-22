class SelectiveProcess < ActiveRecord::Base
	has_many  :activity_process
	validates_presence_of :name_process, :message => "Nome do processo não pode ficar em branco" 
	validates_uniqueness_of :name_process, :message => "Nome do processo já existe" 
	validates_presence_of :responsible, :message => "Selecione um responsável"
	validate :deadline_date_cannot_be_in_the_past

	def get_activities
		@activities = ActivityProcess.where(:SelectiveProcess_id => self.id)
		return @activities
	end

	def deadline_date_cannot_be_in_the_past
    errors.add(:deadline, "Deadline precisa ser maior que a data atual") if
      deadline < Date.today
  end
end
