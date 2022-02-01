---
title: Intelligems Window Object
sidebar_position: 1
---

# Intelligems Window Object

For ease of use, Intelligems adds an object to the global window scope when the page loads. It primarily acts as a read interface for configurations and session-specific A/B tests.

## API Details

The root level object is called `igData`. It should load immediately following the loading of your intelligems javascript library. For information on how to load the javascript library into your Shopify theme, see [Updating Your Theme](shopify-integration/update-your-theme.md)

### The User Object

Most helpful data and functions live on the user object inside of the `igData` object.

You can access it via javascript as follows:

```javascript
console.log(igData.user.igId); // ig_71e855a9313945b63eb35e0abd5b63361d48
```

### Attributes

**`igData.user.igId`** The unique ID associated with this user. It will persist across sessions and is used to connect browsing behavior with other shopify events.

**`igData.user.getPriceByVariantId(variantId)`** Takes in a `variantId` _(Integer, required)_ of the product variant ID for the item in shopify, i.e. 31148541345886 and returns the as a number, i.e. `123.45`. If the variant is not included in any experiment, _null_ will be returned.

**`igData.user.getAlternateVariant(variantId)`** Takes in a `variantId` _(Integer, required)_ of the product variant ID for the item in shopify, i.e. 31148541345886 and returns the relevant variant ID for that user should there be an alternate variant (i.e. if products were duplicated with different prices). If the variant is not included in any experiment, _null_ will be returned.

**`igData.user.getTestGroupName(experimentId)`** Takes in an `experimentId` _(String, UUID)_ and returns the test group, an object of type [TestGroup](entities#testgroup) relevant to this user.
