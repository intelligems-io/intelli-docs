---
sidebar_position: 2
---

# Integrating Your Store

The Intelligems app requires that all product `price` and `compare-at-price` locations be tagged. These tags allow the
app to dynamically modify the price per test group.

## Preview and Integration Modes

The Intelligems Preview and Integration modes will be available after [installing our app](./install-app) on your store.

Two modes exist:

1. **Preview Mode**:  This mode will let you _preview_ your experiment before it goes live. This requires a created (but
   not started) experiment. Enter this mode by adding `?ig-preview=True` to your website's URL.
2. **Integration Mode**: This mode will highlight elements the Intelligems app recognizes. Price elements which have
   been recognized but not changed will be highlighted **blue** and price elements which have been updated will be
   highlighted **orange**. Enter this mode by adding `ig-integration=true` to your website's URL.
3. **Preview Mode & Integration Mode**: Both modes may be used together at once. Enter both by
   adding `?ig-preview=true&ig-integration=true` to your website's URL.

Note: Shopify Plus members using _checkout scripts_ may notice a discrepancy in the cart prices during preview mode.
This will go away once the product price is updated in Shopify.

:::tip

We highly recommend using Integration mode!  This mode will highlight the price elements the Intelligems app recognizes.
A successful integration will highlight all price elements on the page.

:::

## Common Locations for Product Prices

The following examples are by no means the only place product prices may be shown on your site. You should always
thoroughly browse your site and tag and addition product prices, as necessary.

### Collection Pages

Collection pages list multiple products, often by product type or category. Each product will often have a `price` and
a `compare-at-price`.

![Product Grid Item](/img/product-grid-item.png)

### Product Detail Pages (PDP)

Product Detail Pages show details for an individual product. A `price` and `compare-at-price` field will likely exist on
this page. Your Product Detail Pages may also show related products with their corresponding prices - these prices will
need to be tagged.

![Product Details Page](/img/product-details-page.png)

### Search Results Page

Your search bar will likely either a) redirect users to a `search results page` or b) show search results in a dropdown.
In either case, these prices will need to be tagged.

![Search Results Page](/img/search-results-page.png)

## How to Tag Product Prices

### Option 1: Mark Product Prices Using Query Selectors (Recommended)

This option involves marking the **location** of the price element through query selectors. Each selector should be
added to either `additional_price_class_selectors` or `additional_compare_price_class_selectors`, as appropriate, in
your app settings.

1. Right-click a product price on the page and choose `inspect`. A developer-tools window will open up with the element
   you right-clicked highlighted.
2. If the highlighted element already has an `id`, add the ID to your settings page in this format: `#<ID>`.
3. If the highlighted element does not have an `id`, follow its parents outward until you find an element with a
   noteworthy class name.
    1. Create a _path_ to this price element by building a query selector.
    2. See [these docs](https://www.w3schools.com/cssref/css_selectors.asp) for full documentation on to build query
       selectors.

#### Example Query Selector 1:

An appropriate query selector for below would be: `a.grid-link > p.grid-link__meta`

![Query Selector Example 1](/img/query-selector-example-1.png)

#### Example Query Selector 2:

An appropriate query selector for the **64.99 USD** price would be: `div.product-grid-info > p > span.money`
An appropriate query selector for the **105.99 USD** price would be: `div.product-grid-info > p > s > span.money`

![Query Selector Example 2](/img/query-selector-example-2.png)

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

:::info

Need help? If you need help, you can reach out to us as support@intelligems.io for integration assistance.

:::


