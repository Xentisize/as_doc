# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

School.create(english_school: "Tang King Po School", chinese_school: "鄧鏡波學校")
# Contributor.create(contributor_name: "Wik Chan")
# Subject.create(subject: "English")
# Category.create(category: "Simple Present")

# d = Document.create(document_name: "Simple Present Tense", document_year: 1992, term: 2, grade: 11)
# d.schools << School.create(english_school: "Tang King Po School", chinese_school: "鄧鏡波學校")
# d.contributors << Contributor.create(contributor_name: "Wik Chan")
# d.subjects << Subject.create(subject: "English")
# d.categories << Category.create(category: "Simple Present")

subjects = %w[Chinese English Maths IS Physics Chemistry Biology CHistory History Accounts Economics]
formats = %w[Exam Test Worksheet]
contributors = ["Jason Law", "Russell Mak", "Vincent Chan", "Anson Leung"]
categories = ["Simple Present Tense", "Present Continuous Tense", "Present Perfect Tense", "Reading Comprehension", "Listening", "Composition"]

subjects.each do |s|
  Subject.find_or_create_by(subject: s)
end

formats.each do |f|
  Format.find_or_create_by(format: f)
end

contributors.each do |f|
  Contributor.find_or_create_by(contributor_name: f)
end

categories.each do |c|
  Category.find_or_create_by(category: c)
end
