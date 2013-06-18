class Toon < ActiveRecord::Base
  belongs_to :user
  attr_accessor :image
  mount_uploader :image, ImageUploader
  validates :name,:why_fav ,:description,:image,:presence => true
  validates :name,:length => { :minimum => 6, :maximum => 20 },:on=>:create
  has_many :comments, :dependent => :destroy 
    def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
    end
    def self.unapproved(user)
        self.where('state = ? AND created_by != ?', "inactive" , user.id)
      end
      def self.approved(user)
        self.where('state = ? AND created_by != ? ', "approved" , user.id)
      end
       def self.published()
        self.where('state = ?', "published")
      end
      def self.myshow(user)
         self.where('created_by = ? ',  user.id)
      end
   end

