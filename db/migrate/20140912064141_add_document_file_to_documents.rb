class AddDocumentFileToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :file_uid, :string
    add_column :documents, :file_name, :string
  end
end
