class DocFile < ActiveRecord::Base
  has_paper_trail

  belongs_to :doc, optional: true
end
