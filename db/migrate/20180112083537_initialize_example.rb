class InitializeExample < ActiveRecord::Migration[5.1]

  def change
    unless ActiveRecord::Base.connection.table_exists?(:docs)

      create_table :docs do |t|
        t.string :title, limit: 355
        t.timestamps null: false
      end

      create_table :doc_subjects do |t|
        t.belongs_to :doc
        t.belongs_to :subject
      end
      add_index :doc_subjects, [:doc_id, :subject_id], unique: true, name: 'index_doc_to_subjects'

      create_table :subjects do |t|
        t.string :label, index: { unique: true }
      end

      create_table :doc_files do |t|
        t.belongs_to :doc
        t.string :path

        t.timestamps null: false
      end

    end
  end
end
