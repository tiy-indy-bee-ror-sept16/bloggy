class Topicing < ApplicationRecord
  belongs_to :post #post_id
  belongs_to :topic #topic_id
end
