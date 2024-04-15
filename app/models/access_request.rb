class AccessRequest < ApplicationRecord
    belongs_to :user
    belongs_to :directory
end
