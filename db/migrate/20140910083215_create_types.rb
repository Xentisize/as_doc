class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :type

      t.timestamps
    end

    create_table :documents_types, id: false do |t|
      t.belongs_to :document
      t.belongs_to :type
    end
  end
end
