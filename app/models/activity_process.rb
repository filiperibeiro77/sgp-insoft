class ActivityProcess < ActiveRecord::Base
  
  belongs_to :SelectiveProcess
  has_many  :feedback

end
