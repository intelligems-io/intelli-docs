---
sidebar_position: 1
---

# 1. Add Intelligems Javascript

Add our JavaScript as a source into your `theme.liquid` and `checkout.liquid` files. Our script should also be added to 
other files such as `theme.shogun.liquid`. 
```html title="theme.liquid"
<head>
  ...
  <script src="https://cdn.intelligems.io/<your_customer_id>.js"></script>
  ...
</head>
```

Your individual script tag is located on the settings page in the Intelligems App.

![Add Javascript](/img/add_javascript.png)

:::info
If your store does not have a `checkout.liquid` file, you can request one from Shopify.
:::


