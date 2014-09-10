class School < ActiveRecord::Base
  has_and_belongs_to_many :documents
  has_many :contributors
end
