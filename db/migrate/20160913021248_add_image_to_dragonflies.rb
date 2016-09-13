class AddImageToDragonflies < ActiveRecord::Migration[5.0]
  def change
    add_attachment :dragonflies, :image
  end
end
