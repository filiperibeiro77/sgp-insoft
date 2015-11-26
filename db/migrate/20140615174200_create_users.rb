class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :cpf
      t.string :phone
      t.string :departament
      t.string :adress
      t.string :gender
      t.boolean :is_admin
    end
  end
end
