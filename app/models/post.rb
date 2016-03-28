class Post < ActiveRecord::Base
    has_attached_file :image, styles: { big: "450x450#",medium: "175x175#", small: "150x150#",thumb: "125x125#" }, default_url: "http://www.teddybearsdirect.com.au/images/missing_image.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end