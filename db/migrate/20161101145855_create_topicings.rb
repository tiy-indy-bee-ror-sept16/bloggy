class CreateTopicings < ActiveRecord::Migration[5.0]
  def change
    create_table :topicings do |t|
      t.references :post, foreign_key: true
      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
