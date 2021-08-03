---
sidebar_position: 1
---
# Updating Your Theme

As part of the Intelligems integration, you need to make a few changes to your theme. 
1. Add our javascript code
2. Help us identify prices on your page

## Add our javascript code to your frontend
In your `theme.liquid` file, add our javascript as a source. 

```html title="theme.liquid"
<head>
    ...
    <script src="https://cdn.intelligems.io/<your_customer_id>.js"></script>
    ...
</head>
```

You can learn more about what our javascript is doing here.

## Mark the prices on the page

On your site, you might have a few places prices are shown with products. For example, product grid items on a collections page, or right on the PDP. Here are some places to look out for.

### Collections page

On your collections page, you may have multiple products listed, each with a price and a compare-at price. See the following example.

![Product Grid Item](/img/product-grid-item.png)

You need to update the code rendering these, often found in a file called `product-grid-item.liquid`. 
 * Add the class `class="igPrice"` to any html element (like `span`) that contains price.
 * Add the class `class="igComparePrice"` to any html element (like `span`) that contains the compare-at price (the one that is crossed out).
 * Add the product id as a data tag, like `data-product-id="{{product.id}}"`

If originally, your theme contained this code:
```html title="product-grid-item.liquid"
{%- if product.compare_at_price > product.price -%}
    <span class="ProductItem__Price Price">{{ product.price | money }}</span>
    <span class="ProductItem__Price Price--compareAt" >{{ product.compare_at_price | money }}</span>
{%- else -%}
    <span class="ProductItem__Price Price">{{ product.price | money }}</span>
{%- endif -%}
```

We would make the changes so that it looks like this:
```html title="product-grid-item.liquid"
{%- if product.compare_at_price > product.price -%}
    <span class="ProductItem__Price Price igPrice" data-product-id="{{product.id}}">{{ product.price | money }}</span>
    <span class="ProductItem__Price Price--compareAt igComparePrice" data-product-id="{{product.id}}">{{ product.compare_at_price | money }}</span>
{%- else -%}
    <span class="ProductItem__Price Price igPrice" data-product-id="{{product.id}}">{{ product.price | money }}</span>
{%- endif -%}
```

:::info Need help?
If you need help, you can reach out to us as support@intelligems.io for integration assistance.
:::

### Product Detail Page (PDP)

Similar to the collecitons page, you need to tag the prices on the page. **Your prices _must_ be inside the add to cart form**

You do not need to set the `data-product-id` attribute because the intelligems code will infer the product from the add to cart form.

:::caution Add to cart form
Your price tags _must_ be inside the add to cart form (`<form action="cart/add">`) so that the prices can correctly reflect the selected variant. 
:::

```html title="product.liquid"
{%- if product.compare_at_price > product.price -%}
    <span class="ProductItem__Price Price igPrice">{{ product.price | money }}</span>
    <span class="ProductItem__Price Price--compareAt igComparePrice">{{ product.compare_at_price | money }}</span>
{%- else -%}
    <span class="ProductItem__Price Price igPrice">{{ product.price | money }}</span>
{%- endif -%}
```


