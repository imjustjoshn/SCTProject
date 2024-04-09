class CreateDirectories < ActiveRecord::Migration[7.1]
  def change
    create_table :directories do |t|
      t.string :name

      t.timestamps
    end
  end
end
