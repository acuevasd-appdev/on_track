class CreateSupports < ActiveRecord::Migration[6.1]
  def change
    create_table :supports do |t|
      t.string :support_type, null: false
      t.references :fan, null: false, foreign_key: { to_table: :users }, index: true
      t.references :step, null: false, foreign_key: true

      t.timestamps
    end
  end
end
