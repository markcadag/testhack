class Answer < ActiveRecord::Base
	
	belongs_to :user
	belongs_to :topic, :counter_cache => true
	has_many :votes
	acts_as_votable
	acts_as_likeable

	mount_uploader :document, DocumentUploader

end
