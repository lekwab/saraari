module PropertiesHelper

        def property_thumbnail property
            img = property.images.present? ? property.images[0] : "placeholder.jpg"
            image_tag img, class:"property-thumb"
        end

        def property_photo_url property
            property.images.present? ? property.images[0] : asset_url("placeholder.jpg")
        end
    
end
