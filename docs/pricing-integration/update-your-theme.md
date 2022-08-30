---
sidebar_position: 2
---

# Integrating Your Prices

The Intelligems app requires that all product `price` and `compare-at-price` locations be tagged. These tags allow the
app to dynamically modify the price per test group.

## Preview and Integration Modes

The Intelligems Preview and Integration modes will be available after [installing our app](./install-app) on your store.

Two modes exist:

1. **Preview Mode**:  This mode will let you _preview_ your experiment before it goes live. This requires a created (but
   not started) experiment. Enter this mode by adding `?ig-preview=true` to your website's URL.
2. **Integration Mode**: This mode will highlight elements the Intelligems app recognizes. Price elements which have
   been recognized but not changed will be highlighted **blue** and price elements which have been updated will be
   highlighted **orange**. Enter this mode by adding `?ig-integration=true` to your website's URL.
3. **Preview Mode & Integration Mode**: Both modes may be used together at once. Enter both by
   adding `?ig-preview=true&ig-integration=true` to your website's URL.

Note: Shopify Plus members using _checkout scripts_ may notice a discrepancy in the cart prices during preview mode.
This will go away once the product price is updated in Shopify.

:::tip

We highly recommend using Preview and Integration mode! This mode will highlight the price elements the Intelligems app recognizes.
A successful integration will highlight all price elements on the page.

:::

## Common Locations for Product Prices

The following examples are by no means the only place product prices may be shown on your site. You should always
thoroughly browse your site and tag and addition product prices, as necessary.

### Collection Pages

Collection pages list multiple products, often by product type or category. Each product will often have a `price` and
a `compare-at-price`.

![Product Grid Item](/img/product_grid.png)

### Product Detail Pages (PDP)

Product Detail Pages show details for an individual product. A `price` and `compare-at-price` field will likely exist on
this page. Your Product Detail Pages may also show related products with their corresponding prices - these prices will
need to be tagged.

![Product Details Page](/img/pdp.png)

### Search Results Page

Your search bar will likely either a) redirect users to a `search results page` or b) show search results in a dropdown.
In either case, these prices will need to be tagged.

![Search Results Page](/img/search_bar.png)

## How to Tag Product Prices

### Option 1: Intelligems Integration Widget (Recommended)

This option allows you to click on prices in your window to tag them. See how to use the integration widget 
[here](./integration-widget.md).


### Option 2: Edit Your Theme Directly

This option requires updating your theme `.liquid` files directly. The following changes are required:

- Add the class `igPrice` to any html element (i.e. `span`) that contains the product's `price`.
- Add the class `igComparePrice` to any html element (i.e. `span`) that contains the product's `compare-at price`. This
  is the crossed out price.

- Additionally, in the same element as above, add a `data-product-id` attribute, like `data-product-id="{{product.id}}"`

#### Product Details Page Example

##### Original Code:

```html title="product.liquid"
{%- if product.compare_at_price > product.price -%}
<span class="ProductItem__Price Price"
  >{{ product.price | money }}</span
>
<span class="ProductItem__Price Price--compareAt"
  >{{ product.compare_at_price | money }}</span
>
{%- else -%}
<span class="ProductItem__Price Price"
  >{{ product.price | money }}</span
>
{%- endif -%}
```

##### Modified Code:

```html title="product.liquid"
{%- if product.compare_at_price > product.price -%}
 // highlight-next-line
<span class="ProductItem__Price Price igPrice"
  >{{ product.price | money }}</span
>
// highlight-next-line
<span class="ProductItem__Price Price--compareAt igComparePrice"
  >{{ product.compare_at_price | money }}</span
>
{%- else -%}
 // highlight-next-line
<span class="ProductItem__Price Price igPrice"
  >{{ product.price | money }}</span
>
{%- endif -%}
```

#### Collections Page Example

The collections page template is often located in a file called `product-grid-item.liquid`.

##### Original Code:

```html title="product-grid-item.liquid"
{%- if product.compare_at_price > product.price -%}
<span class="ProductItem__Price Price">{{ product.price | money }}</span>
<span class="ProductItem__Price Price--compareAt"
  >{{ product.compare_at_price | money }}</span
>
{%- else -%}
<span class="ProductItem__Price Price">{{ product.price | money }}</span>
{%- endif -%}
```

##### Modified Code:

```html title="product-grid-item.liquid"
{%- if product.compare_at_price > product.price -%}
 // highlight-next-line
<span class="ProductItem__Price Price igPrice" data-product-id="{{product.id}}"
  >{{ product.price | money }}</span
>
<span
 // highlight-next-line
  class="ProductItem__Price Price--compareAt igComparePrice"
   // highlight-next-line
  data-product-id="{{product.id}}"
  >{{ product.compare_at_price | money }}</span
>
{%- else -%}
 // highlight-next-line
<span class="ProductItem__Price Price igPrice" data-product-id="{{product.id}}"
  >{{ product.price | money }}</span
>
{%- endif -%}
```

## Element Tags

Put these tags directly onto the html element you want to affect.

`data-product-id="{{product.id}}"`: Use this tag if the price is not correctly being picked up.

`data-variant-id="{{variant.id}}"`: Use this tag to set the variant id directly onto an element. 

`data-price-offset="<insert-number-here>"`: Use this tag to add/subtract from the price inside the html element.

![data-price-offset Example](/img/data-price-offset.png)

`data-price-multiplier="<insert-number-here>"`: Use this tag to multiply the price inside the html element. Useful for doing per unit prices.

![data-price-multiplier Example](/img/data-price-multiplier.png)


:::info

Need help? If you need help, you can reach out to us as support@intelligems.io for integration assistance. For more information
on creating a price test, see our docs [here](https://help.intelligems.io/article/15-how-to-set-up-price-tests).

:::


