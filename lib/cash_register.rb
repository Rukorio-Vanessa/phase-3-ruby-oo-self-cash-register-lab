require  'pry'
class CashRegister

    attr_accessor :total, :pay_slip
    attr_reader :discount
  
    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @pay_slip = []
    end
  #binding.pry
    def add_item(title, price, quantity = 1)
      @total += price * quantity
      quantity.times { @pay_slip.push({ title: title, price: price, quantity: quantity }) }
    end
  #binding.pry
    def apply_discount

      if @discount > 0
        amount_saved = @total * @discount / 100
        @total -= amount_saved
          "After the discount, the total comes to $#{@total}."
      else
          "There is no discount to apply."
      end

    end
  #binding.pry
    def items
      @pay_slip.map { |item| item[:title] }
    end
  #binding.pry
    def void_last_transaction
      final_transaction = pay_slip.pop
      #binding.pry
      @total -= final_transaction[:price] * final_transaction[:quantity]
    end
    #binding.pry
end
#binding.pry
CashRegister.new(20)