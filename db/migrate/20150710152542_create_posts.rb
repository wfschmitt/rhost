class CreatePosts < ActiveRecord::Migration
  def change
    create_table :rhost_posts do |t|
      t.string :uuid, :title, :slug, :status
      t.text :markdown, :html
      t.boolean :featured, :default => false
      t.boolean :page, :default => false
      t.string :meta_title, :meta_description
      t.integer :author_id
      t.string :author_type
      t.datetime :published_at
      t.timestamps null: false
    end
  end
end
