class Contributor < ActiveRecord::Base
  has_and_belongs_to_many :documents
  belongs_to :school
end
