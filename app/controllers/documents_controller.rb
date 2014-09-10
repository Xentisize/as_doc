class DocumentsController < ApplicationController
  before_action :set_documents, only: [:index]

  def index
  end

  def new
    @document = Document.new
    @school = @document.schools.new
    @subject = @document.subjects.new
    @contributor = @document.contributors.new
    # @categories = Category.new
  end

  def create
    @document = Document.new(document_params)
    subject = Subject.find_or_create_by(document_subject_params)
    @document.subjects << subject

    if @document.save
      redirect_to documents_path
    else
      render 'new'
    end
  end

  private

  def set_documents
    @documents = Document.all
  end

  def document_params
    params.require(:document).permit(:document_year, :term, :grade)
  end

  def document_subject_params
    params.require(:document).permit(subject: [:subject] )
  end
end
