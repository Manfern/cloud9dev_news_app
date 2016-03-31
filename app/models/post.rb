class Post < ActiveRecord::Base
    has_attached_file :image, styles: { big: "450x450#",medium: "175x175#", small: "150x150#",thumb: "112x112#" }, default_url: "http://www.teddybearsdirect.com.au/images/missing_image.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    
    has_many :impressions, as: :impressionable
    
    # def views
    #     impressions.size
    # end
    
    def unique_impression_count
        impressions.group(:ip_address).size #UNTESTED: might not be correct syntax
    end
end

