class Product < ActiveRecord::Base
    has_many :line_items, dependent: :destroy
    belongs_to :shop
end
