---
sidebar_position: 4
---

# 5. Update Cart
Sometimes the Intelligems discount message shows or the compare at price is not correctly displayed. Use these tips and 
tricks to make your cart fully integrated with Intelligems.

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

