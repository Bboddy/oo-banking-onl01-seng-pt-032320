class Transfer
  attr_accessor :sender , :receiver , :status , :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid? #this only checks if the account is open not if the balance is right
    @sender.valid? && receiver.valid?
  end
  
  def valid_bal?
    sender.balance > amount
  end
  
  def execute_transaction
    if valid? && valid_bal? && status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
end
