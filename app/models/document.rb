class Document < ActiveRecord::Base
  require 'RMagick'
  require 'rqrcode_png'
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :subjects
  has_and_belongs_to_many :schools
  has_and_belongs_to_many :formats
  has_and_belongs_to_many :contributors
  accepts_nested_attributes_for :categories

  mount_uploader :file, FileUploader

  after_save :watermarked_the_file

  def watermarked_the_file
    # Setting up paths for processing
    @original_file = file
    if @original_file
      @tmp_file_path = Rails.root.join("public", "uploads", "tmp", "#{file.file.filename}")    # /X/Y/Z/1.pdf
      @tmp_file_basedir = @tmp_file_path.dirname  #  /X/Y/Z
      @tmp_file_basename = @tmp_file_path.basename    #   1.pdf
      @tmp_file_identifier = @tmp_file_basename.to_s.split(".")[0]    # 1

      ### Path for output of qrcode, label and pdf => png
      @png_path = Rails.root.join("public", "uploads", "tmp", "png")
      @png_name_template =
      @label_path = Rails.root.join("public", "uploads", "tmp", "label")
      @qr_path = Rails.root.join("public", "uploads", "tmp", "qr")
      @marked_png_path = Rails.root.join("public", "uploads", "tmp", "marked_png")
      @pdf_path = Rails.root.join("public", "store", "document")
    end

    check_or_create_dirs
    check_or_empty_dirs
    copy_file_for_process
    tmp_to_png

  end

  def check_or_create_dirs
    # Check the existence of dirs, if not create it.
    FileUtils.mkdir_p(@tmp_file_basedir) unless Dir.exist?(@tmp_file_basedir)
    FileUtils.mkdir_p(@png_path) unless Dir.exist?(@png_path)
    FileUtils.mkdir_p(@label_path) unless Dir.exist?(@label_path)
    FileUtils.mkdir_p(@qr_path) unless Dir.exist?(@qr_path)
    FileUtils.mkdir_p(@marked_png_path) unless Dir.exist?(@marked_png_path)
    FileUtils.mkdir_p(@pdf_path) unless Dir.exist?(@pdf_path)
  end

  def check_or_empty_dirs
    dirs = [@tmp_file_basedir, @png_path, @label_path, @qr_path, @marked_png_path, @pdf_path]
    dirs.each do |dir|
      entries = Dir.entries(dir).sort[2..-1]      ## Filtering out "." and ".."
      # entries.each do |entry|

      FileUtils.rm_r Dir.glob('#{dir}.*') if entries.size > 0
    end
  end

  def copy_file_for_process
      FileUtils.cp(@original_file.file.path, @tmp_file_path)
  end

  def tmp_to_png
    pdf = Magick::ImageList.new(@tmp_file_path) { self.density = 200 }
    pdf.write(@png_path)
  end

  def generate_qr_code(string, size)
    qr = RQRCode::QRCode.new(string, :size => 4, :level => :h)
    png = qr.to_img
    png.resize(size[:height], size[:width])
  end

  def generate_label(contents, output_name)
    canvas = Magick::Image.new(800, 300) do
      self.background_color = "none"
    end
    gc.Magick::Draw.new
    gc.pointsize(14)
    gc.text(30, 70, contents)
    gc.draw(canvas)
    canvas.write(output_name)
  end

  def stamp_png_files(png, x, y)
    pdf_template = ChunkyPNG::Image.from_file(png)
    pdf_label = ChunkyPNG::Image.from_file(label_path + "/label.png")
    qr_code = qr_path + "/qr.png"
    pdf_template.compose!(qr_code, x, y)
    pdf_template.compose!(pdf_label, x + 160, y)
    pdf_template.save(png.gsub(".png", "-e.png"), :fast_rgba)
  end

  def to_pdf(png_pages)
    image_lists = Magick::ImageList.new(*png_pages)
    image_lists.write("#{pdf_path}/#{original_file.file.filename}")
  end








end
