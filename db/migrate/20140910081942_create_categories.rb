class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :category

      t.timestamps
    end

    create_table :categories_documents, id: false do |t|
      t.belongs_to :category
      t.belongs_to :document
    end
  end
end
