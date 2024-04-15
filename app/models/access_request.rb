class AccessRequest < ApplicationRecord
    belongs_to :user
    belongs_to :directory

    attribute :status, :integer, default: 0

    enum status: { pending: 0, approved: 1, rejected: 2}
end
