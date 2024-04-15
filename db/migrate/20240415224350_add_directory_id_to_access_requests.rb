class AddDirectoryIdToAccessRequests < ActiveRecord::Migration[7.1]
  def change
    add_reference :access_requests, :directory, null: false, foreign_key: true
  end
end
