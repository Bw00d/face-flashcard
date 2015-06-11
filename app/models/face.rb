class Face < ActiveRecord::Base
	validates :name, presence: true
	validates :agency, presence: true

	has_attached_file :avatar, :url =>':s3_domain_url', :path => '/:class/:attachment/:id_partition/:style/:filename',
  :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  # It returns the articles whose titles contain one or more words that form the query
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    # where("position like ? || agency like ? || name like ?", "%#{query}%") 
    Face.where('name LIKE :query OR agency LIKE :query OR position LIKE :query', query: "%#{query}%")
    # where(['position LIKE ? OR agency LIKE ?', "%#{query}%"])
  end
end
