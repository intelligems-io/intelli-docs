---
sidebar_position: 3
---

# Shopify Plus
:::note Shopify Plus only
You must be using shopify plus to integrate with Intelligems using Scripts Editor. See our [Non-Shopify Plus page](./non-shopify-plus) if you are not using Shopify Plus.
:::

## Scripts Editor
Shopify plus users should add the Intelligems Line Items checkout script to your Scripts Editor. 
Shopify scripts editor enables changing the price in the cart so that your customers pay exactly the price they see.

1. In your shopify admin, go to Apps and click on Scripts Editor.
2. If you already have a Line Items script, you can create a copy and edit it. Make sure our script runs first so that 
discounts get applied in the correct order. Otherwise, create a new Line Items script.
3. Paste the loop below into the script.

```ruby title="Line Item Script"
class Intelligems
  def initialize(discount_property = '_igp', allow_free = false)
    @volume_discount_property = '_igvd'
    @volume_discount_message_property = '_igvd_message'
    @depreciated_property = '_igLineItemDiscount'
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

  def depreciated_discount_product(line_item)
    discount = Money.new(cents: line_item.properties[@depreciated_property])
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
      elsif !line_item.properties[@depreciated_property].nil? && !line_item.properties[@depreciated_property].empty?
             depreciated_discount_product(line_item)
      end
    end
  end
end

intelligems = Intelligems.new()
intelligems.run(Input.cart)

Output.cart = Input.cart
```

## Cart Tips & Tricks
In case discounts or hidden line item properties appear in the cart, here are some helpful things you can do.

### Remove hidden line item properties

Most shopify stores use a convention that any line item with a leading `_` should not be displayed in the cart. Here is a 
common example of how that is implemented in a liquid cart.

The key lines are as follows:

```
{% assign first_character_in_key = p.first | truncate: 1, '' %}
{% unless p.last == blank or first_character_in_key == '_' %}
```
And the result should look like this:

```
{% assign property_size = item.properties | size %}
{% if property_size > 0 %}
  {% for p in item.properties %}
    {% assign first_character_in_key = p.first | truncate: 1, '' %}
    {% unless p.last == blank or first_character_in_key == '_' %}
      {{ p.first }}:
      {% if p.last contains '/uploads/' %}
        <a href="{{ p.last }}">{{ p.last | split: '/' | last }}</a>
      {% else %}
        {{ p.last }}
      {% endif %}
    {% endunless %}
  {% endfor %}
{% endif %}
```
You can learn more about this [here](https://community.shopify.com/c/shopify-design/product-pages-get-customization-information-for-products/m-p/616525).

### Hide the discount

If we're using the Checkout Scripts to apply a "hidden" discount on a product, we don't want to show the user
that they're receiving an intelligems discount. 

This snippet will create a variable `intelligems_discount` per line item which is either 0 or a non-zero number in cents which represents the intelligems price change. This can be used also to adjust strikethrough prices if desired.

```
    {% assign intelligems_total = 0 %}
    {% for item in cart.items %}
      {% case item.properties._igLineItemDiscount %}
        {% when "0" or nil or blank %}
          {% assign intelligems_discount = 0 %}
        {% else %}
          {% assign intelligems_discount = item.properties._igLineItemDiscount | plus: 0 %}
          {% assign intelligems_total = intelligems_total | plus: item.properties._igLineItemDiscount %}
      {% endcase %} 
     ....
    {% endfor %}
```

For the strikethrough price, we might include the condition:
```
{% if intelligems_discount == 0 %}
...
{% endif %}
```
So the final result will look like:

```html
{% if item.original_line_price and item.original_line_price != item.line_price and intelligems_discount == 0 %}
    <span style="text-decoration:line-through;">{{ item.original_line_price | money  }}</span><br>
{% endif %}
```


### Hide the discount message
Sometimes discount messages appear to communicate bundle discounts, etc. In this case, we'll want to hide our message:

```html
{% if item.message and item.message != "" and item.message != "Intelligems" %}
    <br><span>({{ item.message }})</span>
{% endif %}
```

### Integrating Using HandleBars
Follow the example below if you use HandleBars in your theme. Add the HandleBar functions to the rest of your HandleBar 
functions. 

```json
// JS 

Handlebars.registerHelper('noIgDiscount', function(arg1, options) {
    return (arg1.find(discount => discount.discount_application.title === 'intelligems' )) ? options.inverse(this) : options.fn(this) ;
});
Handlebars.registerHelper('hasExtraDiscounts', function(arg1, options) {
    return arg1.some(discount => discount.discount_application.title !== 'intelligems' ) ;
});

// LIQUID EXAMPLES

{{#if discountsApplied}}
   {{#if (hasExtraDiscounts discounts)}}
      <small class="cart__price--strikethrough">{{{price}}}</small>
      <span class="ajaxcart__price">
          {{{discountedPrice}}}
      </span>
  {{else}}
      <small class="cart__price">{{{price}}}</small>
  {{/if}}
            
  {{else}}
     {{#if shouldShowComparePrice}}                                           
       <small class="cart__price--strikethrough">{{{comparePrice}}}</small>                                                                                    
     {{/if}}     
      <span class="ajaxcart__price {{#if shouldShowComparePrice}}tw-text-red{{/if}} ">
          {{{price}}}
      </span>
{{/if}}

{{#if discountsApplied}}
  <div class="text-right grid__item">
      {{#noIgDiscount discounts}}
          {{#each discounts}}
              <small class="ajaxcart__discount cart__discount">
                  {{this.discount_application.title}}
                  (-{{{this.formattedAmount}}})
              </small>
          {{/each}}
          {{else}}
      {{/noIgDiscount}}
  </div>
{{/if}}
```

