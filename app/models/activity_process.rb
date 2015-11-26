class ActivityProcess < ActiveRecord::Base
  
  belongs_to :SelectiveProcess
  has_many  :feedback

  validates_presence_of :name_activity, :message => "Nome da atividade não pode ficar em branco"
  validates_presence_of :SelectiveProcess_id, :message => "Selecione um processo para a atividade"
	validates_presence_of :responsible_activity, :message => "Selecione um responsável para a atividade"
	validate :deadline_date_cannot_be_in_the_past


  def deadline_date_cannot_be_in_the_past
    errors.add(:deadline, "Deadline precisa ser maior que a data atual") if
      deadline_activity < Date.today
  end

end
