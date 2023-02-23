require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test

	def test_accept_money
		cash_register = CashRegister.new(20)
		transaction = Transaction.new(5)
		transaction.amount_paid = 5
		assert_equal(25, cash_register.accept_money(transaction))
	end

	def test_change
		cash_register = CashRegister.new(20)
		transaction = Transaction.new(3)
		transaction.amount_paid = 5
		amount_before = cash_register.total_money
		change = cash_register.change(transaction)
		amount_after = cash_register.total_money
		assert_equal(2, change)
	end

	def test_give_receipt

		cash_register = CashRegister.new(20)
		item_cost = 3
		transaction = Transaction.new(item_cost)
		input = StringIO.new("5\n")
		output = StringIO.new
		transaction.prompt_for_payment(input: input, output: output)
		assert_output("You've paid $#{item_cost}.\n") { cash_register.give_receipt(transaction) }
		#p "You've paid $#{item_cost}.\n"
		#cash_register.give_receipt(transaction)
	end

end