---
title: Price
---

# `price`

```ts
window.igData.price
```


The following functions are available in `igData.price`:
- [getPriceByVariantId([variantId])](#getPriceByVariantId)
- [getDiscountByVariantId([variantId])](#getDiscountByVariantId)
- [getAltProductHandle([handle])](#getAltProductHandle)
- [getAltVariantId([variantId])](#getAltVariantId)
---


## price.getPriceByVariantId([variantId]) {#getPriceByVariantId}
:::info Example

```ts
console.log(igData.price.getPriceByVariantId(32305433935974));

"89.95"
```

:::

#### Parameters
```ts
variantId: string
```
#### Returns
```ts
price: string | null
```
> The price for this product based on the user's test group and the product variant id.  
If the variant is not included in any experiment, it will return null.


---

## price.getDiscountByVariantId([variantId]) {#getDiscountByVariantId}
:::info Example

```ts
console.log(igData.price.getDiscountByVariantId(32305433935974));

"1005"
```

:::

#### Parameters
```ts
variantId: string
```

#### Returns
```ts
discount: string | null
```
> The discount for this user based on their test group and the
product variant id. This discount is in cents (or equivalent currency).


---

## price.getAltProductHandle([handle]) {#getAltProductHandle}
:::info Example

```ts
console.log(igData.price.getAltProductHandle("dutch-oven"));

"dutch-oven-1"
```

:::
#### Parameters
```ts
handle: string
```

#### Returns
```ts
altHandle: string
```
> Product handle of duplicated product based on the user's current test group.


---

## price.getAltVariantId([variantId]) {#getAltVariantId}
:::info Example

```ts
console.log(igData.price.getAltVariantId("32305433935974"));

"51805463582052"
```

:::
#### Parameters
```ts
variantId: string
```

#### Returns
```ts
variantId: string | null
```
> Corresponding variant ID of duplicated product based on the passed variant ID and the user's current test group.
