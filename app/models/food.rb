class Food < ApplicationRecord
    has_many :ordered_foods
    has_many :orders, through: :ordered_foods
    belongs_to :restaurant

    # def self.options_for_order(foods)
    #     options = []
    #     foods.each do |food|  
    #         options << {food.name => food.price}
    #     end
    #     options
    # end

    def increment
        if self.id == Food.last.id
            next_id = Food.first.id
        else
            next_id = self.id + 1
        end
    end

    def decrement
        if self.id == Food.first.id
            previous_id = Food.last.id
        else
            previous_id = self.id - 1
        end
    end
end
