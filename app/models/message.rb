class Message < ApplicationRecord
  belongs_to :group
  validates :content, :presence => true
  validates :author, :presence => true
end
