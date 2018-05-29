class Doc < ActiveRecord::Base
  has_paper_trail

  # Normal file relationships
  has_many :doc_files

  # Has Many Through
  has_many :doc_subjects, dependent: :destroy
  has_many :subjects, :through=>:doc_subjects

end
