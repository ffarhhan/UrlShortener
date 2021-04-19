require 'uri'
class Url < ApplicationRecord
  validates :url, presence:true
  has_many :addresses, dependent: :destroy
end