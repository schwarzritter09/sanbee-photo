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

  scope :not_close, -> {where(close_flag: false)}
  scope :my_article, -> user_id {where(user_id: user_id)}

  scope :by_username, -> username { joins(:user).where('username = ?', username)}

  def self.search(article_search)

    articles = Article.not_close

    if article_search
      articles = articles.where(member_id: article_search[:member_id]) if article_search[:member_id].present?
      articles = articles.has_requestmember_id(article_search[:requestmember_id]) if article_search[:requestmember_id].present?
      articles = articles.where(user_id: article_search[:user_id]) if article_search[:user_id].present?
      articles = articles.by_username(article_search[:user_name]) if article_search[:user_name].present?

    else
    end

    articles.order('id DESC')

  end
  
  def request_member_list
    names = ""
    self.members.each_with_index do |requestmember, i|
      names += requestmember.name
      names += (i+1 >= self.members.count) ? '' : ','
    end

    names
  end
end
