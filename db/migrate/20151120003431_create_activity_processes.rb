class CreateActivityProcesses < ActiveRecord::Migration
  def change
    create_table :activity_processes do |t|
      t.references :SelectiveProcess, index: true
      t.string :name_activity
      t.string :responsible_activity
      t.text :descricao_activity
      t.date :deadline_activity

      t.timestamps
    end
  end
end
