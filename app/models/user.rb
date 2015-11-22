class User < ActiveRecord::Base

  before_create :create_remember_token
	before_save { self.email = email.downcase }

  
	validates_presence_of :name, :message => "Nome não pode ficar em branco"
 	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates_uniqueness_of :email, case_sensitive:false, :message => "E-mail já cadastrado no sistema"
  	validates_presence_of :email, :message => "E-mail não pode ficar em branco"
    validates_format_of :email, with: VALID_EMAIL_REGEX, :message => "Entre com um formato válido de e-mail"
  	has_secure_password validations: false
    validates_confirmation_of :password, :message => "Senha e a confirmação dela não são iguais"
    validates_presence_of :password, :message => "A senha não pode ser em branco"
    validates_length_of :password, minimum: 6, :message => "A senha deve conter no mínimo 6 caracteres"

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
