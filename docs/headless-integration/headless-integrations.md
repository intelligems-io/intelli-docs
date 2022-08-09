---
title: Headless Integrations 
sidebar_position: 1
---

# Headless Integrations

:::info
 
**Limited Support** Intelligems currently has limited support for headless integrations, but we have successfully supported several sites and have a react npm package on the roadmap!

:::

## Add Javascript to Site 

Add your intelligems javascript to the `<head>` of your site. This will load intelligems when the page loads in your end users' browsers. 

For more info, see [adding javascript](../pricing-integration/add-javascript)

## Building the Cart

There are two required components to building the cart. 

The first is adding the `igId` to the cart custom attributes. You can get the [igId](./intelligems-window-object/user#igId) from our Javascript API and include it in a snippet like this:


```js
const input = {
	customAttributes: [
		{key: "igId", value: igData?.user.igId}
	]
}

checkout = await shopifyStorefront.checkout.updateAttributes(
	checkoutId,
	input
)
```

The second is adding the [Test Group](./intelligems-window-object/user#getTestGroup) ID to each line item. A sample snippet is like this:

```js
const customLineItemAttributes = [
	{key: "_igTestGroup", value: igData?.user.getTestGroup(igData?.user.getExperiments()[0]?.id)?.id}
]

```

You can find more information about our Javascript API [here](../javascript-api/intelligems-window-object)
