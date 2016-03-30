class Impression < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    belongs_to :impressionable, polymorphic: true, counter_cache: :views

end
