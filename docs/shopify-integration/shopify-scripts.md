---
sidebar_position: 2
---

# Update Scripts Editor

Shopify scripts editor enables changing the price in the cart so that your customers pay exactly the price they

:::note Shopify Plus only
You must be using shopify plus for this feature to work appropriately.
:::

1. In your shopify admin, go to Apps and click on Scripts Editor.
2. If you already have a Line Items script, you can create a copy and edit it. Otherwise, create a new Line Items script.
3. Paste the loop below into the script.

```ruby title="Line Item Script"
Input.cart.line_items.each do |line_item|
  if !line_item.properties['_igLineItemDiscount'].nil? && ! line_item.properties['_igLineItemDiscount'].empty?
    discount = Money.new(cents: line_item.properties['_igLineItemDiscount'])
    discount *= line_item.quantity
    line_item.change_line_price(line_item.line_price - discount, message: 'intelligems')
  end
end

Output.cart = Input.cart
```
