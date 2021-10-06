Created main.rb to hold price_rules as a Constant hash.  Hash includes price rules for each item and discount for entire
basket.  Also serves as playground for trying different combinations of adding items to the shopping cart.

Created checkout.rb that receives price_rules and assigns it to instance variable @price_rules on initialization.  Init
also executes method set_default_purchase_quantity which sets the default value for the purchases hash to 0.  This
allows items to be added to the purchases hash with += 1 and avoid a nil error with the scan method.

The total method in checkout.rb creates a total_costs variable with the assigned value of 0.  The method then iterates
through each item and quantity (key, and value) in the purchases hash.  The method then does a conditional check:

```ruby
if !discount_quantity(item) || quantity < discount_quantity(item)
```
If the item does not have a discount quantity or the quantity does not exceed the discount quantity for the given item
then it adds the item_price * the quantity to the total costs variable. Otherwise it adds the discount_price for the 
item * the quantity to the total costs variable.  

Once it iterates through the entire purchases hash it checks to see if the total costs is over £200.  If it is then it 
returns total_costs - the total_costs * basket_discount with a conversion to an integer to drop the decimal place as 
requested in the README.  Otherwise it returns the total_costs value.

I like to use a lot of one line methods for readability and prefer to condense as much as possible.  Hence the methods
pulling values from the price_rules hash that follow after the set_default_purchase_quantity.

The spec processes the examples of the final values provided in the README.md file.

Stinkyink checkout

An e-commerce platform sells the following items:

| Item | Price |
| --- | --- |
| A | £50 |
| B | £30 |
| C | £20 |

Additionally, the platform offers some discounts:

- 2 items A for £90
- 3 items B for £75
- 10% off total basket cost for baskets worth over £200 (after previous discounts)

You must write a solution using Ruby, to be used like this:

```ruby
checkout = Checkout.new(price_rules)
checkout.scan(item)
checkout.scan(item)
price = checkout.total
```

Here are some examples of final values:

| Items | Basket total |
| --- | --- |
| A, B, C | £100 |
|  B, A, B, B, A | £165 |
| C, B, A, A, C, B, C | £189 |

When designing your solution, keep in mind that the platform may wish to add new discounts in the future.  What programming principle(s) should you follow to make the process of adding new-discounts as straightforward as possible?  Say a new developer takes over from where you left off, and they need to make changes to the system - what (in terms of code design) would best set this new developer up to succeed? Your solution should reflect how you would answer these sorts of questions.

Write tests to make sure your code works. Commit regularly, so we can follow the decisions you made.

Unless you have a good reason to incorporate rails, a db, or provide a cli, please focus on a PORO solution.

If you have any questions, feel free to email technical@stinkyink.com.
