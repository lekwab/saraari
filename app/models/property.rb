class Property < ApplicationRecord
    has_many_attached :images
    belongs_to :account

    validate :image_type

    def thumbnail input
        return self.images[input].variant(resize: '300x200!')
    end

    

    private
    def image_type
        if images.attached? == false
            errors.add(:images, 'are missing!')
    end
    images.each do |image|
        if !image.content_type.in?(%('image/jpeg image/jpg image/png'))
            errors.add(:images, 'need to be a JPG, JPEG or PNG')
        end
    end
    end
    
    scope :latest, -> { order created_at: :desc }
 end
