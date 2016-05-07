class Academy < ActiveRecord::Base
	include PgSearch
	has_many :academia_takings
  	has_many :users,  -> { distinct }, :through => :academia_takings 
  	has_many :topics

  	pg_search_scope :search,
                :against => [:name],       
                :using => {
                    :tsearch => {
                    	:normalization => 2,:prefix => true
                    },
                    :trigram => {},
                    :dmetaphone => {}
                }
end
