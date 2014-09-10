# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

School.create(english_school: "Tang King Po School", chinese_school: "鄧鏡波學校")
Contributor.create(contributor_name: "Wik Chan")
Subject.create(subject: "English")
Category.create(category: "Simple Present")

d = Document.create(document_name: "Simple Present Tense", document_year: 1992, term: 2, grade: 11)
d.schools << School.create(english_school: "Tang King Po School", chinese_school: "鄧鏡波學校")
d.contributors << Contributor.create(contributor_name: "Wik Chan")
d.subjects << Subject.create(subject: "English")
d.categories << Category.create(category: "Simple Present")
