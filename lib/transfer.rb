Ωclass Transfer
  
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount, transer)
    @sender = sender
    @receiver = receiver 
    @amount = amount 
    @status = "pending"
  end 
  
  def valid?
    @receiver.valid? && @sender.valid? ? true : false 
  end 
  
  def execute_transaction
    if @sender.balance > @amount && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "reject"
      return "Complete"
    end
  end
  
    def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end 