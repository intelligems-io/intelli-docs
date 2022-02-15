---
sidebar_position: 3
---

# Cart Tips & Tricks

In case discounts or hidden line item properties appear in the cart, here are some helpful things you can do.

## Remove hidden line item properties

Most shopify stores use a convention that any line item with a leading `_` should not be displayed in the cart. Here is a 
common example of how that is implemented in a liquid cart.

The key lines are as follows

```html
{% assign first_character_in_key = p.first | truncate: 1, '' %}
{% unless p.last == blank or first_character_in_key == '_' %}
```
And the result should look like this

```html
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
You can learn more about this [here](https://community.shopify.com/c/shopify-design/product-pages-get-customization-information-for-products/m-p/616525)

## Hide the discount

If we're using the Checkout Scripts to apply a "hidden" discount on a product, we don't want to show the user
that they're receiving an intelligems discount. For the strikethrough price, we might include the condition:
```
(item.properties._igLineItemDiscount == "0" or item.properties._igLineItemDiscount == blank or item.properties._igLineItemDiscount == nil)
```
So the final result will look like:

```html
{% if item.original_line_price and item.original_line_price != item.line_price and (item.properties._igLineItemDiscount == "0" or item.properties._igLineItemDiscount == blank or item.properties._igLineItemDiscount == nil) %}
    <span style="text-decoration:line-through;">{{ item.original_line_price | money  }}</span><br>
{% endif %}
```


## Hide the discount message
Sometimes discount messages appear to communicate bundle discounts, etc. In this case, we'll want to hide our message:

```html
{% if item.message and item.message != "" and item.message != "intelligems" %}
    <br><span>({{ item.message }})</span>
{% endif %}
```