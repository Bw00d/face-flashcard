class Face < ActiveRecord::Base
	validates :name, presence: true
	validates :agency, presence: true
end
