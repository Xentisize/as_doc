module DocumentsHelper

  def listing_subject(doc)
    if doc.subjects.first
      doc.subjects.first.subject
    else
      ""
    end
  end

  def listing_categories(doc)
    return_string = ""
    if doc.categories.empty?
      return_string = ""
    else
      doc.categories.each do |c|
        return_string << c.category << "<br/>"
      end
    end
    return_string
  end

  def listing_eng_school(doc)
    if doc.schools.empty?
      ""
    else
      doc.schools.first.english_school ? doc.schools.first.english_school : ""
    end
  end

  def listing_chi_school(doc)
    if doc.schools.empty?
      ""
    else
      doc.schools.first.chinese_school ? doc.schools.first.chinese_school : ""
    end
  end

  def listing_format(doc)
    if doc.formats.empty?
      ""
    else
      doc.formats.first.format
    end
  end

  def listing_grade(doc)
    if doc.grade
      case doc.grade
      when 1..6
        "P.#{doc.grade}"
      when 7..12
        "F.#{doc.grade - 6}"
      when 13..17
        "U.#{doc.grade - 12}"
      else
        "0"
      end
    end
  end

  def listing_contributor(doc)
    if doc.contributors.first
      doc.contributors.first.contributor_name
    else
      ""
    end
  end


end
