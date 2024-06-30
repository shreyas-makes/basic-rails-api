class CreateArticles < ActiveRecord::Migration[7.2]
  def change
    create_table :articles do |t|
      t.text :title
      t.text :content

      t.timestamps
    end
  end
end
