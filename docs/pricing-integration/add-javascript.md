---
sidebar_position: 1
---

# Add Intelligems Javascript

In your `theme.liquid` file, add our JavaScript as a source. Your individual script tag is located on the settings page in
the Intelligems App.

```html title="theme.liquid"
<head>
  ...
  <script src="https://cdn.intelligems.io/<your_customer_id>.js"></script>
  ...
</head>
```

:::info
 
**Shopify Plus Members** should also add this script to `checkout.liquid` and other files such as `theme.shogun.liquid`.

:::