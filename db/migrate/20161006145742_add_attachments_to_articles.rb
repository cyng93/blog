class AddAttachmentsToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :attachments, :json
  end
end
