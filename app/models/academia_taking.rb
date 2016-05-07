class AcademiaTaking < ActiveRecord::Base
	belongs_to :user
	belongs_to :academy
end
