class Post < ApplicationRecord
  belongs_to :user
  has_many :topicings
  has_many :topics, through: :topicings
  has_many :rejoiners

  # validates_presence_of :user

  def topic_names
    topics.collect(&:name).join(", ")
  end

end
