class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :attachimg
      t.belongs_to :project, foreign_key: true

      t.timestamps
    end
  end
end
