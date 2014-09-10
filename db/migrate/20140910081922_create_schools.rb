class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :english_school
      t.string :chinese_school
      t.timestamps
    end

    # Create the join table for has_and_belongs_to_many relationship to document
    create_table :documents_schools, id: false do |t|
      t.belongs_to :school
      t.belongs_to :document
    end
  end
end
