class RemoveSlugFromUsers < ActiveRecord::Migration[5.0]
  def up
    remove_column :users, :slug
  end

  def down
    add_column :users, :slug, :string
  end
end
