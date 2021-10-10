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
