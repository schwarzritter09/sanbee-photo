class AddTweetidToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :tweetid, :string
  end
end
