require 'uri'
class Url < ApplicationRecord
  validates :url, presence:true
end