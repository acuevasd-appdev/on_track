class CreateSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :steps do |t|
      t.text :caption
      t.string :image
      t.integer :comments_count, default: 0
      t.integer :supports_count, default: 0
      t.references :habit, null: false, foreign_key: true, index: true
      t.datetime :date_completion, null: false

      t.timestamps
    end
  end
end
