---
sidebar_position: 2
---

# Cart Progress Bar

The Intelligems Cart Progress bar can be used to replace your current cart progress bar even without a test running. 

## Setup
1. Paste `<ig-shipping-progress-container></ig-shipping-progress-container>` into your store's theme at the location 
you wish the progress bar to render. Make sure to remove or comment out your current progress bar.
2. Intelligems uses classes to access the cart subtotal. In the Intelligems App, go to the Settings and scroll to the 
Progress Bar Settings section. Press Edit, and under the Cart section, replace `.igSubtotal` with the class corresponding
to your cart's subtotal. If the cart subtotal has no nearby classes, add `igSubtotal` as a class. 

## Customization
You can customize the Intelligems Cart Progress Bar in the Progress Bar modal located in the settings page. 
If you are looking for additional customization, email support@intelligems.io.

## Using the Progress Bar Without A Test
Under the Threshold section, use `Default Threshold` to set the free shipping threshold when there are no live 
experiments. This allows you to continue using the Intelligems Cart Progress Bar even when you are not running a test.
To hide this progress bar when no test is live, set the default threshold to 0.

## Integrating With Rebuy
Follow [this](https://help.rebuyengine.com/en/articles/6120362-how-to-use-a-custom-template-with-smart-cart) article 
to integrate the Intelligems Cart Progress Bar with Rebuy Cart.