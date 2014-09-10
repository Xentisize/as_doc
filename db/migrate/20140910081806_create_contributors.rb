class CreateContributors < ActiveRecord::Migration
  def change
    create_table :contributors do |t|
      t.string :contributor_name
      t.belongs_to :school

      t.timestamps
    end

    # create the join table for has_and_belongs_to relationship with the document
    create_table :contributors_documents, id: false do |t|
      t.belongs_to :contributor
      t.belongs_to :document
    end
  end
end
