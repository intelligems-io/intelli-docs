---
sidebar_position: 1
---

# Advanced Settings
The advanced settings are located in the Settings page of the Intelligems App. Email support@intelligems.io to receive 
access to this section of the settings page.

## Intercept ATC XHR
By default, this is turned on in order to correctly change your prices using checkout scripts. When a user presses add to 
cart with this setting on, the XHR script sent from the site to Shopify is intercepted and modified by Intelligems before sending to Shopify.

## Currency Format 
Specifies format for how currencies are displayed on your website. When editing this field, make sure to press `Validate` 
before pressing `Save Configurations`.
```json title="Currency Format Structure"
{
    "options": {
      "localeMatcher": "string",
      "style": "string",
      "currency": "string",
      "currencyDisplay": "string",
      "currencySign": "string",
      "useGrouping": boolean,
      "minimumIntegerDigits": number,
      "minimumFractionDigits": number,
      "maximumFractionDigits": number,
      "minimumSignificantDigits": number,
      "maximumSignificantDigits": number,
    }, 
    "symbol": "string",
    "suffix": "string",
    "removeTrailingZeros": boolean,
}
```

```json title="Currency Format Example"
{
    "options": {
        "minimumFractionDigits": 0,
    }, 
  "symbol": "$",
  "suffix": " USD",
}
```

See documentation [here](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat) for more information on the options object., 
## Currency Function
Specifies which currency function to use when adding our prices to your site. If you use a standard formatMoney function
in your window.theme object (i.e. `window.theme.Currency.formatMoney`), you can insert that into this field like this: 
`window.theme.Currency.formatMoney`. You can also create a custom formatMoney function in your `theme.liquid`
file. 

```javascript title="Custom Currency Function"
<head>
    ...
    <script>
        try {
          window.igCurrencyFn = (price) => {
            let code = "USD";
            const value = `; ${document.cookie}`;
            const parts = value.split(`; cart_currency=`);
            if (parts.length === 2) {
              code = parts.pop().split(";").shift();
            }
    
            const formatter = new Intl.NumberFormat("en-US", {
              style: "currency",
              currency: code,
            });
    
            return `<span class=money>${formatter.format(price/100)} ${code} </span>`;
          };
        } catch (error) {
          console.log(error);
        }
    </script>
    ...
</head>
```



## Find and Replace
Find and replace is used to find text on your website and replace it with the appropriate text pertaining to each test 
group. This can be setup within your experiment inside the `Advanced Options` section. By default, Intelligems uses selectors
to change the innerHtml of the text. But we offer the option to use regex to change the outerHtml of the text.