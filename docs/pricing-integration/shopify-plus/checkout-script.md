---
sidebar_position: 4
---

# 4. Add Checkout Script
:::note Shopify Plus only
You must be using shopify plus to integrate with Intelligems using Scripts Editor. See our [Non-Shopify Plus page](../non-shopify-plus/non-plus-add-javascript.md) if you are not using Shopify Plus.
:::

## Scripts Editor
Add the Intelligems Line Items checkout script to your Scripts Editor. 
Shopify scripts editor enables changing the price in the cart so that your customers pay exactly the price they see.

1. In your shopify admin, go to Apps and click on Scripts Editor.
2. If you already have a Line Items script, you can create a copy and edit it. Make sure our script runs first so that 
discounts get applied in the correct order. Otherwise, create a new Line Items script.
3. Paste the loop below into the script. Save and publish the script

```ruby title="Line Item Script"
class Intelligems
  def initialize(discount_property = '_igp', allow_free = false)
    @volume_discount_property = '_igvd'
    @volume_discount_message_property = '_igvd_message'
    @deprecated_property = '_igLineItemDiscount'
    @discount_property = discount_property
    @allow_free = allow_free
  end

  def discount_product(line_item)
    ig_price = Money.new(cents: line_item.properties[@discount_property])

    discount = line_item.line_price - ig_price
    if discount > Money.zero
      discount *= line_item.quantity
      line_item.change_line_price(line_item.line_price - discount, message: 'Discount')
    end

  end

  def deprecated_discount_product(line_item)
    discount = Money.new(cents: line_item.properties[@deprecated_property])
    discount *= line_item.quantity

    if @allow_free or discount < line_item.line_price
      line_item.change_line_price(line_item.line_price - discount, message: 'Intelligems')
    end
  end

  def volume_discount(line_item)
    discount = Money.new(cents: line_item.properties[@volume_discount_property])
    discount *= line_item.quantity

    if discount < line_item.line_price
      message = line_item.properties[@volume_discount_message_property]
      line_item.change_line_price(line_item.line_price - discount, message: message)
    end
  end

  def run(cart)
    cart.line_items.each do |line_item|
      if !line_item.properties[@discount_property].nil? && !line_item.properties[@discount_property].empty?
        discount_product(line_item)
      elsif !line_item.properties[@volume_discount_property].nil? && !line_item.properties[@volume_discount_property].empty?
        volume_discount(line_item)
      elsif !line_item.properties[@deprecated_property].nil? && !line_item.properties[@deprecated_property].empty?
             deprecated_discount_product(line_item)
      end
    end
  end
end

intelligems = Intelligems.new()
intelligems.run(Input.cart)

Output.cart = Input.cart
```
