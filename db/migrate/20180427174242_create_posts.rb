class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.column :content, :string
      t.column :rating, :integer
      t.column :project_id, :integer
    end
  end
end
