# options show on screen-------------------
puts "Select option accordingly:"
puts "Press 1 for Account Opening Form"
puts "Press 2 for Customer_List"
puts "Press 3 for Amount_Transaction"
puts "Press 4 for Passbook"
puts "Press 5 for Exit"

# class creation-------------
class BankingProject

  $users_array = []         # Global variable array
  @@user_count = 0          # class variable

  def self.cust_data()
    puts "Hi Customer...Fill your details below."
    @@user_count = @@user_count + 1

    print "Enter your name:"
    name = gets.chomp.to_s

    print "Enter your Balance Amount:"
    balance = gets.chomp.to_i
   
    print "Enter your pin:"
    pwd = gets.chomp.to_i

    
    @user_data = {id: @@user_count, name: name, balance: balance, pwd: pwd, transactions: []}
    $users_array.push(@user_data)
  end
  # Customer list method------------
  def self.cust_details()   
    puts $users_array
  end

  # Transaction between 2 users-----------------------------
  def self.amount_transaction(sender,receiver,amount)
    user1 = $users_array.find{ |x| x[:id] == sender}

    left_balance  = user1[:balance] - amount
    user1[:balance] = left_balance

    transaction = {sender: sender, receiver: receiver, amount: -amount}
    user1[:transactions].push(transaction)
 
    user2 = $users_array.find{ |x| x[:id] == receiver}

    new_balance  = user2[:balance] + amount
    user2[:balance] = new_balance

    transaction = {sender: sender, receiver: receiver, amount: amount}
    user2[:transactions].push(transaction)
   
    return user1[:balance], user2[:balance]
  end

    # comparing/finding id's for transactions------------
  def self.sender_cust(sender)
    $users_array.find{ |x| x[:id]==sender}
  end
  def self.receiver_cust(receiver)
    $users_array.find{|y| y[:id]==receiver}
  end
  def self.sender_balance(sender,amount)
    user= $users_array.find{|z| z[:id]==sender}
    if amount<=user[:balance]
      user[:balance] -= amount
    else
      error
  end
  def self.validate_pin(sender,pin)
    user=$users_array.find{|a| a[:id]==sender}
    pin=user[:pwd]
  end












  loop do
    case gets.chomp.to_i
      when 1
        puts "Account Opening form"
        cust_data

      when 2
        puts "Customer List"
        cust_details
      when 5
        puts "Thanks for Banking with us"
        break
    end
  end
end
