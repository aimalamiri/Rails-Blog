class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.belongs_to :user, index: true, foreign_key: true, counter_cache: true
      t.belongs_to :post, index: true, foreign_key: true, counter_cache: true
      t.text :text

      t.timestamps
    end
  end
end
