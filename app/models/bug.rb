class Bug < ActiveRecord::Base
  validates :message, presence: true

  scope :pending_bugs, -> { where fixed: false }
end
