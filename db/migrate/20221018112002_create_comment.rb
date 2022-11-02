class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :author, foreign_key: { to_table: 'users' }, on_delete: :cascade
      t.references :post, null: false, foreign_key: true
      t.string :text
      t.timestamps
    end
  end
end
