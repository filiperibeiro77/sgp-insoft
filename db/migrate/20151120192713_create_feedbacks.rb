class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.references :ActivityProcess, index: true
      t.string :author
      t.string :subject
      t.text :content

      t.timestamps null: false
    end
  end
end
