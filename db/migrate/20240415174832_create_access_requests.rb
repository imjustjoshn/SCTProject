class CreateAccessRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :access_requests do |t|

      t.timestamps
    end
  end
end
