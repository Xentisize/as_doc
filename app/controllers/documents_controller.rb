class DocumentsController < ApplicationController
  before_action :set_documents, only: [:index]

  def index
  end

  def new
    @document = Document.new
    @school = @document.schools.new
    @subject = @document.subjects.new
    @contributor = @document.contributors.new
    @format = @document.formats.new
    @categories = @document.categories.build

    # Variables for datalist during input form
    @contributors = Contributor.all
    @subjects = Subject.all
    @schools = School.all
    @formats = Format.all
    @categories = Category.all
  end

  def show
    @document = Document.find(params[:id])
    logger.info @document
    respond_to do |format|
      format.html {  }
      # format.json { render :json => @document}
      format.js
    end
  end

  def create
    @document = Document.new(document_params)

    ### Check and input the presence of association
    unless document_subject_params[:subject].blank?
      subject = Subject.find_or_create_by(document_subject_params[:subject])
      @document.subjects << subject
    end

    unless document_contributor_params[:contributor].blank?
      contributor = Contributor.find_or_create_by(document_contributor_params[:contributor])
      @document.contributors << contributor
    end

    unless document_format_params[:format].blank?
      format = Format.find_or_create_by(document_format_params[:format])
      @document.formats << format
    end

    unless document_school_params[:school][:english_school].blank? && document_school_params[:school][:chinese_school].blank?
      chinese_school = School.find_by(chinese_school: document_school_params[:school][:chinese_school])
      if chinese_school.blank?
        english_school = School.find_by(english_school: document_school_params[:school][:english_school])
        if english_school.blank?
          english_school = School.create(document_school_params[:school])
          @document.schools << english_school
        end
      else
        if chinese_school.english_school == document_school_params[:school][:english_school]
          @document.schools << chinese_school
        else
          redirect_to new_document_path
        end
      end
    end

    #   school = School.find_or_create_by(chinese_school: document_school_params[:school][:chinese_school)


    #   if document_school_params[:school][:english_school].blank?
    #     school = School.find_or_create_by(chinese_school: document_school_params[:school][:chinese_school])
    #   else
    #     school = School.find_or_create_by(english_school: document_school_params[:school][:english_school])
    #   end
    #   @document.schools << school
    # end

    document_categories_params[:categories_attributes].keys.each do |k|
      if document_categories_params[:categories_attributes][k].blank?
        category = nil
      else
        category = Category.find_or_create_by(category: document_categories_params[:categories_attributes][k][:category])
      end
      @document.categories << category
    end


    if @document.save
      redirect_to documents_path
    else
      render 'new'
    end
  end

  def match_school
    if params[:school] =~ /[A-Za-z]+/
      @school = School.find_by(english_school: params[:school])
    else
      @school = School.find_by(chinese_school: params[:school])
    end
    respond_to do |format|
      format.json { render :json => @school }
    end
  end

  private

  def set_documents
    @documents = Document.all
  end

  def document_params
    params.require(:document).permit(:document_year, :term, :grade, :file)
  end

  def document_subject_params
    params.require(:document).permit(subject: [:subject] )
  end

  def document_contributor_params
    params.require(:document).permit(contributor: [:contributor_name])
  end

  def document_school_params
    params.require(:document).permit(school: [:english_school, :chinese_school])
  end

  def document_format_params
    params.require(:document).permit(format: [:format])
  end

  def document_categories_params
    params.require(:document).permit(categories_attributes: [[:category]])
  end

end
