class Directory < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :access_requests
end
