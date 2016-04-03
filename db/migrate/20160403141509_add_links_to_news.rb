class AddLinksToNews < ActiveRecord::Migration
   
  def up
    add_column :posts, :market_url, :string
  end
 
  def down
    remove_column :posts, :market_url
  end
  
end
