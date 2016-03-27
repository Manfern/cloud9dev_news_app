class Post < ActiveRecord::Base
    has_attached_file :image, styles: { medium: "300x300>", small: "150x150#",thumb: "100x100>" }, default_url: "http://www.teddybearsdirect.com.au/images/missing_image.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end