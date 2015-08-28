class Tag < ActiveRecord::Base
  # Remember to create a migration!
  has_many :propertytags
  has_many :properties, through: :propertytags
  validates :tag, presence: true
  before_save :downcase_tag

  def self.create_tags (string_tags)
  	tags_obj = []
  	arr_tags = string_tags.gsub(/\s+/,"").gsub(/^,*|(?<=,),|,*$/,"").split(",")

  	arr_tags.each do |t|
      if Tag.exists?(tag: t)
  		tags_obj << Tag.find_by(tag: t)
      else
        tags_obj << Tag.create(tag: t)
      end
  	end

  	tags_obj
  end

  private

  def downcase_tag
  	self.tag = self.tag.downcase 
  end

end