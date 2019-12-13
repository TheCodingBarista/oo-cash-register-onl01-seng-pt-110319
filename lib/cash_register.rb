class CashRegister
  attr_accessor :total, :discount, :last_transaction, :item, :items
  
  def initialize(discount = 0)
    @items = []
    @discount = discount
    @total = 0
  end
  
  def add_item(item, price, quantity = 1)
    if quantity > 1
      @last_transaction = price*quantity
      @total += @last_transaction
        quantity.times do
          @items << item
        end
    else 
      @last_transaction = price
      @items << item
     @total += @last_transaction
    end
    @total
  end
  
  def apply_discount
    if @discount > 0
      @discount = @discount/100.to_f
      @total = @total - (@total * (@discount))
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end
  
  def void_last_transaction
    @total -= @last_transaction
  end
  
end