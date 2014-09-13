class DocumentSerializer < ActiveModel::Serializer
  ActiveSupport.on_load(:active_model_serializers) do
    ActiveModel::Serializer.root = false
    ActiveModel::ArraySerializer.root = false
  end

  has_many :categories

  attributes :id, :document_year, :term, :grade
end
