class Article < ActiveRecord::Base
  mount_uploader :obverse_photo, ObversePhotoUploader
  mount_uploader :reverse_photo, ReversePhotoUploader

  belongs_to :user
  belongs_to :member
  has_many :photos
  has_many :requestmembers, :dependent => :destroy
  has_many :members, :through => :requestmembers

  accepts_nested_attributes_for :requestmembers, :allow_destroy => true,
  :reject_if => lambda{ |attrs| attrs[:member_id].blank? }

  scope :has_requestmember_id, -> requestmember_id { joins(:requestmembers).where('requestmembers.member_id = ?', requestmember_id)}

  def self.search(article_search)

    if article_search
      puts 'search'
      articles = Article.all
      articles = articles.where(member_id: article_search[:member_id]) if article_search[:member_id].present?
      articles = articles.has_requestmember_id(article_search[:requestmember_id]) if article_search[:requestmember_id].present?

    else
      puts 'all'
      articles = Article.all
    end

    articles.order('id DESC')

  end
end
