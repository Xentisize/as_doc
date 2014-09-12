class CreateFormats < ActiveRecord::Migration
  def change
    create_table :formats do |t|
      t.string :format

      t.timestamps
    end

    create_table :documents_formats, id: false do |t|
      t.belongs_to :document
      t.belongs_to :format
    end
  end
end
