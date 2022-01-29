class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum production_status: { not_startable: 0, waiting_for_production: 1, in_productions: 2,  production_completed: 3}
end
