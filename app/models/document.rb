class Document < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :schools
  has_and_belongs_to_many :formats
  # has_and_belongs_to_many :types
  has_and_belongs_to_many :contributors
  accepts_nested_attributes_for :categories

  dragonfly_accessor :file
end
