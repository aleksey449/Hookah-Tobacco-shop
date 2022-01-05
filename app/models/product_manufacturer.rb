class ProductManufacturer < ApplicationRecord
    validates :title, presence: true, lenght: {minimum: 2}
    validates :body, presence: true, lenght: {minimum: 2}

    def formatted_created_at
        created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
end
