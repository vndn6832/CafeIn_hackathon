class Shop < ActiveRecord::Base
    # 여러 메뉴를 가지고 있다
    has_many :menus
    has_many :products
    has_many :comments
    has_many :favorite
    has_many :users, through: :favorite
    
    def self.search(search)
      where("name LIKE ?", "%#{search}%") 
    end
end
