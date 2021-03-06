class Customer < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :orders, dependent: :destroy
    has_many :ordered_foods, through: :orders
    has_many :restaurants, through: :orders
    has_many :restaurants, through: :reviews
    has_secure_password

    validates :username, uniqueness: {message: "Username already taken." }
    validates :name, presence: {message: "Must have a Name." }
    validates :username, presence: {message: "Must have a Username" }
    validates :password, presence: {message: "Must have a password" }

    def increment
        if self.id == Customer.last.id
            next_id = Customer.first.id
        else
            next_id = self.id + 1
        end
    end

    def decrement
        if self.id == Customer.first.id
            previous_id = Customer.last.id
        else
            previous_id = self.id - 1
        end
    end

    def total_orders
        if self.orders != []
        price_arr = self.orders.map {|order|order.price}
        price_arr.sum
        else
        price_arr = 0
        end
    end

    

end
