class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :subject

      t.timestamps
    end

    # Create the join table for the document
    create_table :documents_subjects, id: false do |t|
      t.belongs_to :document
      t.belongs_to :subject
    end
  end
end
