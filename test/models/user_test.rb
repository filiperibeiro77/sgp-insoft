require 'test'
   class UserTest < ActiveSupport::TestCase
      fixtures :users
      def test_create_user
         user_joao = User.new :name => users(:user).name,
                              :email => users(:user).email
   end
   def test_save_user user_joao
      assert user_joao.save
   end
   def test_update_user
      user_joao = test_create_user
      user_joao.name = ""
      test_save_user user_joao.name
   end
   def test_destroy_contato
      contato_brena = test_create_user
      test_save_user user_joao
      user_joao.destroy
   end
end
