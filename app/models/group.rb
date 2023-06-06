class Group < ApplicationRecord
    belongs_to :author, class_name: 'User'
  has_many :entities

  validates :name, presence: true

  def user_name(author_id)
    User.find(author_id).name
  end

  def total_spent(id)
   entities = Entity.where(group_id: id)
    total = 0
    entities.each do |entity|
      total += entity.amount
    end
    total
  end
end
