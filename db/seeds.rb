if Subject.count == 0
  Subject.create(label: 'Subject 1')
  Subject.create(label: 'Subject 2')
  Subject.create(label: 'Subject 3')
end

# Create a document
doc = Doc.new(title: 'Doc1')

Doc.transaction do
  doc.subjects << Subject.first
  doc.doc_files << DocFile.create(path: 'path1')
  doc.save!
end
puts "Actual -- Title: " + doc.title + " subject: " + doc.subjects[0].label + " with file path: " + doc.doc_files[0].path
puts "\n"
puts "\n"

# Update a document using clears and << associations
Doc.transaction do
  doc.subjects.clear
  doc.subjects << Subject.all[1]
  doc.doc_files.clear
  doc.doc_files << DocFile.create(path: 'path2')
  doc.title = "Doc1 UPDATED"
  doc.save!
end

puts "Actual -- Title: " + doc.title + " subject: " + doc.subjects[0].label + " with file path: " + doc.doc_files[0].path
puts "\n"

doc.versions.reverse.each_with_index do |doc_ver, index|
  doc_reified = doc_ver.reify(has_many: true, belongs_to: true, has_one: true)
  if doc_reified.present?
    title = doc_reified.title
    if doc_reified.subjects.present?
      subject = doc_reified.subjects[0].label
    else
      subject = 'None'
    end

    if doc_reified.doc_files.present?
      file = doc_reified.doc_files[0].path
    else
      file = 'None'
    end

    puts "Version " + (doc.versions.size - index - 1).to_s + " -- Title: " + title + " subject: " + subject + " with file path: " + file
    puts "\n"
  end
end
puts "\n"

# Updates a document using ids
Doc.transaction do
  doc.subject_ids = [Subject.last.id]
  file = DocFile.create(path: 'path3')
  doc.doc_file_ids = [file.id]
  doc.title = "Doc1 FINAL"
  doc.save!
end

puts "Actual -- Title: " + doc.title + " subject: " + doc.subjects[0].label + " with file path: " + doc.doc_files[0].path
puts "\n"

doc.versions.reverse.each_with_index do |doc_ver, index|
  doc_reified = doc_ver.reify(has_many: true, belongs_to: true, has_one: true)
  if doc_reified.present?
    title = doc_reified.title
    if doc_reified.subjects.present?
      subject = doc_reified.subjects[0].label
    else
      subject = 'None'
    end

    if doc_reified.doc_files.present?
      file = doc_reified.doc_files[0].path
    else
      file = 'None'
    end

    puts "Version " + (doc.versions.size - index - 1).to_s + " -- Title: " + title + " subject: " + subject + " with file path: " + file
    puts "\n"
  end
end
