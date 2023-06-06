class Entity < ApplicationRecord
    belongs_to :author, class_name: 'User'
    belongs_to :group
  
    validates :name, presence: true
    validates :amount, presence: true
  
    def total_entities(id)
      total = 0
      Entity.where(group_id: id).each do |entity|
        total += entity.amount
      end
      total
    end
  end
