class Address < ApplicationRecord
  validates :name ,presence:true
  validates :postal_code,  presence: true
   # 郵便番号のフォーマット指定 ハイフン無し７桁固定 Viewのフォーム設定
   validates :address, presence: true
   belongs_to :customer
   def full_address
    '〒' + postal_code + ' ' + address + ' ' + name
   end
end
