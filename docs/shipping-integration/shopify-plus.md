---
sidebar_position: 4
---

# Checkout Scripts

If your store uses more complex logic to calculate your shipping rates (i.e. shipping by weight), Intelligems can integrate and account for that 
logic using a checkout script. 

:::note Shopify Plus only
You must be using shopify plus to integrate with Intelligems using Scripts Editor.
:::

## Scripts Editor
Shopify plus users should add the Intelligems Shipping checkout script to your Scripts Editor. 

1. In your shopify admin, go to Apps and click on Scripts Editor.
2. If you already have a Shipping script, you can create a copy and edit it.
3. Paste one of the scripts below into the editor.

```ruby title="No Threshold Test Shipping Script"
## Configurations
control = "<your_control_group_id>"
test = "<your_test_group_id>"
lowerShippingRate = Money.new(cents: 900)
testGroupProperty='_igTestGroup'
testGroup = nil
standardShippingRate = "Ground Shipping"
## end configurations

# Initial product loop
Input.cart.line_items.each do |line_item|
  # Check the shipping group
  if !line_item.properties[testGroupProperty].nil? && ! line_item.properties[testGroupProperty].empty?
    testGroup = line_item.properties[testGroupProperty]
  end
end

Input.shipping_rates.each do |shipping_rate|
  case testGroup
  when control
  	if shipping_rate.name == standardShippingRate && shipping_rate.price > lowerShippingRate
  		shipping_rate.apply_discount(shipping_rate.price - lowerShippingRate, message: "Discount")	
  	end
	else
    if shipping_rate.name == standardShippingRate && shipping_rate.price > lowerShippingRate
      shipping_rate.apply_discount(shipping_rate.price - lowerShippingRate, message: "Discount")  
    end
  end
end

Output.shipping_rates = Input.shipping_rates
```

```ruby title="Threshold Test Shipping Script"
## Configurations
free_shipping_text = "Free Shipping"
group69 = "<your_group69_id>"
group74 = "<your_group74_id>"
group79 = "<your_group79_id>"
group89 = "<your_group89_id>"
testGroupProperty='_igTestGroup'
testGroup = nil
standardShippingRate = "SurePost Economy (2-5 days)"
## end configurations

## Checks for discounts and calculates their effect
cart = Input.cart
cart_discounted_subtotal = cart.subtotal_price
if !cart.discount_code.nil? 
  cart_discounted_subtotal =
    case cart.discount_code
    when CartDiscount::Percentage
      if cart.subtotal_price >= cart.discount_code.minimum_order_amount
        cart.subtotal_price * ((Decimal.new(100) - cart.discount_code.percentage) / 100)
      else
        cart.subtotal_price
      end
    when CartDiscount::FixedAmount
      if cart.subtotal_price >= cart.discount_code.minimum_order_amount
        [cart.subtotal_price - cart.discount_code.amount, Money.new(cents: 0)].max
      else
        cart.subtotal_price
      end
    else
      cart.subtotal_price
  end
end

# Initial product loop
Input.cart.line_items.each do |line_item|
  # Check the shipping group
  if !line_item.properties[testGroupProperty].nil? && ! line_item.properties[testGroupProperty].empty?
    testGroup = line_item.properties[testGroupProperty]
  end
end

Input.shipping_rates.each do |shipping_rate|
  case testGroup
  when group69
  	if cart_discounted_subtotal >= Money.new(cents: 6900) && shipping_rate.price > Money.new(cents: 0) && shipping_rate.name == standardShippingRate
  		shipping_rate.apply_discount(shipping_rate.price, message: "Free Shipping")	
  	end
  when group74
    if cart_discounted_subtotal >= Money.new(cents: 7400) && shipping_rate.price > Money.new(cents: 0) && shipping_rate.name == standardShippingRate
  		shipping_rate.apply_discount(shipping_rate.price, message: "Free Shipping")	
  	end
  when group79
    if cart_discounted_subtotal >= Money.new(cents: 7900) && shipping_rate.price > Money.new(cents: 0) && shipping_rate.name == standardShippingRate
  		shipping_rate.apply_discount(shipping_rate.price, message: "Free Shipping")	
  	end
  when group89
    if cart_discounted_subtotal >= Money.new(cents: 8900) && shipping_rate.price > Money.new(cents: 0) && shipping_rate.name == standardShippingRate
  		shipping_rate.apply_discount(shipping_rate.price, message: "Free Shipping")	
  	end
	else
	  if cart_discounted_subtotal >= Money.new(cents: 6900) && shipping_rate.price > Money.new(cents: 0) && shipping_rate.name == standardShippingRate
  		shipping_rate.apply_discount(shipping_rate.price, message: "Free Shipping")	
  	end
  end
end

Output.shipping_rates = Input.shipping_rates
```

:::note Test Group ID
Email support@intelligems.io to receive your test group IDs.
:::