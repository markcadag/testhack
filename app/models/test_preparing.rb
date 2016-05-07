class TestPreparing < ActiveRecord::Base
	
	validates :course_id, presence: true
  	validates_numericality_of :course_id
  	validates_numericality_of :user_id
	
	belongs_to :course
	belongs_to :user
	
end
