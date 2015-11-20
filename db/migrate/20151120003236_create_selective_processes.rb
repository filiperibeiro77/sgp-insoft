class CreateSelectiveProcesses < ActiveRecord::Migration
  def change
    create_table :selective_processes do |t|
      t.string :name_process
      t.string :responsible
      t.date :deadline

      t.timestamps
    end
  end
end
