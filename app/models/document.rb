class Document < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :schools
  has_and_belongs_to_many :formats
  # has_and_belongs_to_many :types
  has_and_belongs_to_many :contributors
  accepts_nested_attributes_for :categories


  dragonfly_accessor :file

  #   if File.exist? f.path
  #     move_the
  #   :move_the_file(f)
  # end
  # after_save :move_the_file

  def move_the_file(f)
    # if File.exist? f.path
      move_the_file_to_tmp(f)
    # end
  end

  # def file_path
    # Rails.join("public", "system", "")

  def move_the_file_to_tmp(f)
    logger.info(f.path)
    FileUtils.cp(f.path, Rails.root.join("tmp", "processing"))
  end


end
