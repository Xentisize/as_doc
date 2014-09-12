class Document < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :schools
  has_and_belongs_to_many :formats
  # has_and_belongs_to_many :types
  has_and_belongs_to_many :contributors
  accepts_nested_attributes_for :categories

  dragonfly_accessor :file

  # # before_save :generate_document_name

  # # def generate_document_name
  # #   # Format-Primary-Subject-School-Form-Year-Term-[id].pdf
  # #   doc_name = ""
  # #   doc_name << "#{formats.first.format}-" unless formats.first.blank?
  # #   doc_name << generate_grade_format << "-"
  # #   doc_name << "#{subjects.first.subject}-" unless subjects.first.blank?
  # #   doc_name << "#{grade}-" unless grade.blank?
  # #   doc_name << "#{document_year}-" unless document_year.blank?
  # #   doc_name << "#{term}" unless term.blank?
  # #   # doc_name
  # #   # "#{formats.first.format unless formats.first.blank?}-#{generate_grade_format}-#{subjects.first.subject unless subjects.first.blank?}"
  # #   update(document_name: doc_name)
  # # end

  # def abbreviate_school_name
  #   abbreviated_school = ""
  #   schools.first[:english_school].split("").each do |word|
  #     abbreviated_school << word[0]
  #   end
  #   abbreviated_school
  # end

  # def generate_grade_format
  #   if grade.blank?
  #     ""
  #   else
  #     case grade
  #     when 1..6
  #       "Primary"
  #     when 7..12
  #       "Secondary"
  #     when 13..17
  #       "Teritary"
  #     else
  #       "U"
  #     end
  #   end
  # end



end
