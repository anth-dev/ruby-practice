=begin
Assignment:
Implement a method #stock_picker that takes in an array of stock prices, one
for each hypthetical day. It should return a pair of days representing the best
day to buy and the best day to sell. Days start at 0

  - You need to buy before you can sell
  - Pay attention to edge cases like when the lowest day is the last day or the
    highest day is the first day.

example:
> stock_picker([17,3,6,9,15,8,6,1,10])
=> [1,4]  # for a profit of $15 - $3 == $12

=end

require 'pry'

def stock_picker(prices)
  # Use an array to store the data we find with each element being another
  # array with the following data [max_profit, buy_day, sell_day]
  max_profit_per_day = []

  # Iterate over 'prices' array and for each buy day calculate the maximum
  # possible profit if you bought on that day.
  prices.each_with_index do |buy_price, buy_day|

    # Get all the remaining days after the current buy_day.
    remaining = prices[buy_day + 1..-1]

    # Use an array to store the data for the current day
    possible_profit = []

    # Iterate over all the remaining days and calculate the profit if you
    # were to sell on that day.
    remaining.each_with_index do |sell_price, sell_day|

      # format the data imagined in the above puts and store the data in an
      # array
      possible_profit.push([sell_price - buy_price, buy_day, sell_day + buy_day + 1])
    end
    
    # Sort the possible profits for the day and push the highest one to the
    # max_profit_per_day array.
    max_profit_per_day[buy_day] = possible_profit.sort.pop

  end

# Get rid of the nil value, and sort the array, and store the most profitable
# day in an array.
when_to_buy_and_sell = max_profit_per_day.compact.sort.pop

# shift the profit out of the array
when_to_buy_and_sell.shift

# return the day to buy and sell
when_to_buy_and_sell
end

p stock_picker([17,3,6,9,15,8,6,1,10])