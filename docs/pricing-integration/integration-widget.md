---
sidebar_position: 3
---

# Intelligems Integration Widget

### Intelligems Integration Widget
After installing the Intelligems app and adding the Intelligems Javascript to your frontend, the next step is to make 
sure Intelligems is aware of where prices appear in your store. The easiest way to do this is using the Integration 
widget, which we'll walk you through step-by-step in this doc.

Don't worry! Changes made in the integration widget will have no effect on your live store until you have a live test
The Integration Widget offers full support for Google Chrome. Support for other browsers, including Firefox, is limited. 
If you are having an issue with the Widget in another browser, we suggest trying to run it in Google Chrome. For more 
support, reach out to us for support at support@intelligems.io!

### Using the Integration Widget
1. **Enable integration mode**: Go to your store's homepage, and add ?ig-integration=true to the end of the URL. You should 
now see the Intelligems integration widget floating in the top left part of the page:
![Enable Widget](/img/integration-widget/integration_widget_step1.png)

2. **Add price selectors**: Go to the "Selectors" tab in the integration widget and click the price select icon to enter 
selection mode:
![Widget](/img/integration-widget/integration_widget_selectors.png)
While in selection mode, you'll notice elements of the page highlighted in light red as you move your cursor around the 
page. Find a price element and click. You'll now notice the element is highlighted in blue, and the query selector has 
been added to the list in the widget:
![Widget](/img/integration-widget/integration_widget_price_selector.png)

3. **Add compare at price selectors**: Now, do the same for compare at price elements, this time by clicking the compare 
at selector icon, then clicking on compare at price elements:
![Widget](/img/integration-widget/integration_widget_compare_selector1.png)
![Widget](/img/integration-widget/integration_widget_compare_2.png)
During your test, compare at elements that you specify 
here will be replaced with the test compare at price if one is specified. If no compare at price is specified for a 
test group, the compare at element will be hidden.

4. **Tag price elements everywhere in your store**: Continue this process, tagging price and compare at price elements
everywhere in your store, including the homepage, collection pages, search results, and product detail pages (PDPs). 
You'll know you're done when all price and compare at price elements are highlighted in blue on all pages in your store.

5. **Save your changes**: Once you've tagged all price elements in your store, you can save your changes by clicking the 
Save button: 
![Widget](/img/integration-widget/integration_widget_save.png)
This saves the query selectors you've chosen to your Intelligems configuration. You will not notice any 
effects on your live site until you have a test running.

### Troubleshooting

#### Overlapping selectors
While choosing selectors as described above, you may notice a warning:This warning means that you have chosen selectors 
that resolve to the same element in the Price and Compare At Price sections. This can be a problem, because Intelligems 
will not know which price should be shown in that element: the item's price or the item's compare at price. 
To avoid this issue, you should remove the overlapping selector from one of the two sections.

#### Tagging elements that cannot be selected with the widget
If there are price elements you're unable to tag using query selectors with the widget, you can also add the .igPrice or 
.igComparePrice class to the element in your theme. For more information, head over to our technical documentation.

#### Adding the data-product-id attribute to an element
In addition to knowing which elements in your store are prices, Intelligems also needs to know which product each price 
is for. Typically, Intelligems is able to figure this out automatically, but in some circumstances you may need to set 
it explicitly on a price element. To do this, set the data-product-id attribute. For example, 
data-product-id="{{product.id}}".

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