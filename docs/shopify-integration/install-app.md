---
sidebar_position: 1
---

# Installing the App

## Adding Our JavaScript Code to Your Frontend

In your `theme.liquid` file, add our JavaScript as a source. Your individual script tag is located in the settings page on
the Intelligems App.

```html title="theme.liquid"
<head>
  ...
  <script src="https://cdn.intelligems.io/<your_customer_id>.js"></script>
  ...
</head>
```