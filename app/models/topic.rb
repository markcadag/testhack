class Topic < ActiveRecord::Base
	include PgSearch
	belongs_to :user
	has_many :comments
    belongs_to :course
    belongs_to :academy
    
    validates :course, presence: true
    validates :subject, presence: true
    validates :content, presence: true
    validates :user, presence: true

    # has_many :taggings
    # has_many :categories, through: :taggings

    has_many :answers
    has_many :appear_ins

    acts_as_likeable
    acts_as_commentable
    
    is_impressionable :counter_cache => true, :column_name => :cached_views_count
 	acts_as_followable
    acts_as_taggable

 	pg_search_scope :search,
                :against => [:subject, :content],       
                :associated_against => {
                    :tags => [:name]    
                },
                :using => {
                    :tsearch => {
                    	:normalization => 2,:prefix => true
                    },
                    :trigram => {},
                    :dmetaphone => {}
                },
                :order_within_rank => "topics.updated_at DESC"
                
    def self.weekly_topics
        Topic.order("created_at DESC")
    end

    def self.top_topics
        Topic.order("answers_count DESC")
    end

    def self.hot_topics
        Topic.order("cached_views_count DESC")
        # Topic.where("created_at >= ?", 1.day.ago.utc).order("created_at DESC")
    end


end
