class Document < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :schools
  has_and_belongs_to_many :types
  has_and_belongs_to_many :contributors
end
