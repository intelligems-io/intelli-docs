---
title: Intelligems Window Object
sidebar_position: 1
---

# Intelligems Window Object

For ease of use, Intelligems adds an object to the global window scope when the page loads. It primarily acts as a read
interface for configurations and session-specific A/B tests.

## API Details

The root level object is called `igData`. It should load immediately following the loading of your intelligems
javascript library. For information on how to load the javascript library into your Shopify theme,
see [Installing the App](shopify-integration/install-app.md).


--- 

## Overview
```js
window.igData
```
- [user](./intelligems-window-object/user)
  - [igId](./intelligems-window-object/user#igId)
  - [getExperiments()](./intelligems-window-object/user#getExperiments)
  - [getTestGroup([experimentId])](./intelligems-window-object/user#getTestGroup)
  - [getTestGroupName([experimentId])](./intelligems-window-object/user#getTestGroupName)
- [price](./intelligems-window-object/price)
  - [getPriceByVariantId([variantId])](./intelligems-window-object/price#getPriceByVariantId)
  - [getDiscountByVariantId([variantId])](./intelligems-window-object/price#getDiscountByVariantId)
  - [getAltProductHandle([handle])](./intelligems-window-object/price#getAltProductHandle)
  - [getAltVariantId([variantId])](./intelligems-window-object/price#getAltVariantId)
