class Comment < ActiveRecord::Base
   belongs_to :user
   belongs_to :toon

   attr_accessible :body

   validates :user_id, :presence => true
   validates :toon_id, :presence => true
   validates :body, :presence => true, :length => { :maximum => 5000 }     # spam protection

   default_scope :order => 'comments.created_at asc'
end
