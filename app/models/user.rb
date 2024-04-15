class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :access_requests
  has_many :directories, through: :access_requests

  def can_access_directory?(directory)
    requested_access = access_requests.exists?(directory_id: directory.id)

    return true if admin?
    requested_access
  end
end
