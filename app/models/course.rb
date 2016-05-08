class Course < ActiveRecord::Base
  include PgSearch
  acts_as_followable

  has_many :test_preparings
  has_many :users,  -> { distinct }, :through => :test_preparings 


  has_many :topic
  has_many :appear_ins

  pg_search_scope :search,
                  :against => :name,
                  :using => {
                    :tsearch => {
                    	:normalization => 2,:prefix => true
                    },
                    :trigram => {}
                  }
end
