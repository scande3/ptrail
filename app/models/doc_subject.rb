class DocSubject < ActiveRecord::Base
  belongs_to :doc
  belongs_to :subject
  has_paper_trail
end
