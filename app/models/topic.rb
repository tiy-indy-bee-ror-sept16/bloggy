class Topic < ApplicationRecord
  has_many :topicings
  has_many :posts, through: :topicings

  def to_param
    name
  end

end
