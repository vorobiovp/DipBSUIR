class SeedCommentsAndReplies < ActiveRecord::Migration[6.0]
    def change
        @post = Post.create :topic_id => 1, :title => "My First Tattoo", :body => "Handpoke Tattoo"
        @comment1 = Comment.create :post_id => @post.id, :parent_id => 0, :body => "Nice!"
        @reply1 = Comment.create :post_id => @post.id, :parent_id => @comment1.id, :body => "Thx"
        @reply2 = Comment.create :post_id => @post.id, :parent_id => @comment1.id, :body => "+1"

        @comment2 = Comment.create :post_id => @post.id, :parent_id => 0, :body => "Price?"
        @reply3 = Comment.create :post_id => @post.id, :parent_id => @comment2.id, :body => "$40"
    end
  end