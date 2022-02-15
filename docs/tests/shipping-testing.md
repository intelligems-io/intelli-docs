---
sidebar_position: 2
---

# Shipping Tests with Intelligems

Shipping is often a significant cost in e-comm, and it can be frustrating to watch it eat into margins. Organizations
differ on their approach to dealing with this cost - some pass this cost onto consumers, some offer free shipping, some
require a minimum threshold to ship for free.

While you can find a lot of blog posts that tell you “the only way to do it,” we’ve found that there is no universal
truth when it comes to shipping - what works for some brands may not work for others. The only way to figure out what is
best for your company is to experiment with different approaches.

Intelligems helps you run these experiments, and gather real data about how various shipping charges (or discounts)
affect consumer behavior. This doc will walk you through how to run shipping tests with Intelligems, and some best
practices to keep in mind.

## How to Run Shipping Tests with Intelligems:

### Setting up your test groups

1. Click ‘Create New Experiment’ at the top-left of the Intelligems app page and select ‘Shipping Experiment’ from the
   list of options

   ![Screen Shot 2022-01-13 at 9.31.42 AM.png](/img/shipping-testing/Screen_Shot_2022-01-13_at_9.31.42_AM.png)

   ![Screen Shot 2022-01-13 at 9.34.47 AM.png](/img/shipping-testing/Screen_Shot_2022-01-13_at_9.34.47_AM.png)


1. On the Shipping Experiment detail page, fill in the Name and Description of the Experiment you wish to create

    <aside>
    💡 Put some detail in the description! Tests can be live for several weeks, and people do sometimes forget how they set things up :)

    </aside>

   ![Screen Shot 2022-01-06 at 2.44.41 PM.png](/img/shipping-testing/Screen_Shot_2022-01-06_at_2.44.41_PM.png)


1. Create as many groups as you would like to include in the test by clicking on the ‘+ Group’ icon

    <aside>
    💡 The more groups you have, the longer it will take to get statically significant results. You’ll need > 100-200 orders *for each group* in the test to be confident

    </aside>

   ![Screen Shot 2022-01-06 at 2.48.29 PM.png](/img/shipping-testing/Screen_Shot_2022-01-06_at_2.48.29_PM.png)


1. Name the groups for the experiment and use the slider to allocate what percentage of traffic will go to each group.
   Click ‘Continue’ when you are done.

    <aside>
    💡 Splits will default to even among the groups, but some users prefer to allocate more traffic to the control group

    </aside>

   ![Screen Shot 2022-01-06 at 2.52.24 PM.png](/img/shipping-testing/Screen_Shot_2022-01-06_at_2.52.24_PM.png)

### Setting the shipping rates that you want to test

1. On the ‘Set Shipping Rates’ page, input the settings for each group

![Screen Shot 2022-01-06 at 3.07.15 PM.png](/img/shipping-testing/Screen_Shot_2022-01-06_at_3.07.15_PM.png)

<aside>
💡 Selecting ‘Free Shipping’ will disable the inputs for shipping fee and free shipping threshold. Select this option only if this group should have free shipping for all order values

</aside>

<aside>
💡 Intelligems only supports a flat shipping fee at the moment. What you put in the “Shipping Fee” Column will apply to *all orders* that do not hit the threshold. If you have specific needs here, please reach out to support@intelligems.io and we’ll see what we can do

</aside>

### Creating banners for your test groups

1. If you wish to create banners on your site to show your customers your shipping rates, click the edit banner icon
   within the relevant group.

   ![Screen Shot 2022-01-06 at 3.17.44 PM.png](/img/shipping-testing/Screen_Shot_2022-01-06_at_3.17.44_PM.png)


1. Customize your banner text, formatting and functionality through the inputs in the modal. Click ‘Save’ when you’re
   done!

   ![Screen Shot 2022-01-06 at 3.24.43 PM.png](/img/shipping-testing/Screen_Shot_2022-01-06_at_3.24.43_PM.png)


1. With your rates selected and banners designed, click ‘Continue’ on the Set Shipping Rates page to create the
   experiment

<aside>
💡 Don’t worry, this won’t set the test live yet!

</aside>

![Screen Shot 2022-01-06 at 3.28.37 PM.png](/img/shipping-testing/Screen_Shot_2022-01-06_at_3.28.37_PM.png)

### Configuring Shopify shipping profiles

1. From the Shopify admin console, navigate to Settings → Shipping and Delivery
2. Click ‘Manage rates’ for the relevant shipping profiles

   ![Screen Shot 2022-01-07 at 2.10.14 PM.png](/img/shipping-testing/Screen_Shot_2022-01-07_at_2.10.14_PM.png)

<aside>
💡 If you use custom shipping profiles, you will need to configure each profile to be included in the test

</aside>

1. Scroll down to the section titled ‘Shipping from’ and choose ‘Add rate’ in the location relevant to your test

   ![Screen Shot 2022-01-07 at 2.19.14 PM.png](/img/shipping-testing/Screen_Shot_2022-01-07_at_2.19.14_PM.png)


1. Select ‘Use carrier or app to calculate rates’ and use the dropdown menu to select Intelligems as the rates provider.
   Click ‘Done’.

   ![Screen Shot 2022-01-07 at 2.27.02 PM.png](/img/shipping-testing/Screen_Shot_2022-01-07_at_2.27.02_PM.png)

### Review your site prior to launch

1. Using an incognito browser for each session, go through the checkout process with different values and number of
   items to see the different variants in place

### Launching your experiment

1. On the Intelligems app page, click ‘Start’ on the row for the experiment you just created. Your experiment is now
   live!

   ![Screen Shot 2022-01-13 at 9.36.42 AM.png](/img/shipping-testing/Screen_Shot_2022-01-13_at_9.36.42_AM.png)

<aside>
💡 The experiment is now live, but you’re not done yet! See below for an important step

</aside>

1. IMPORTANT: Back on the shipping profile configuration page in Shopify, remove other rates so that all rate
   information comes from the Intelligems app. We recommend taking a screenshot of your existing configuration so that
   you can reconfigure your old rates when the test has ended.

   ![Screen Shot 2022-01-07 at 2.38.34 PM.png](/img/shipping-testing/Screen_Shot_2022-01-07_at_2.38.34_PM.png)


1. Click ‘Save’

   ![Screen Shot 2022-01-07 at 2.52.20 PM.png](/img/shipping-testing/Screen_Shot_2022-01-07_at_2.52.20_PM.png)

<aside>
💡 Congrats! You’ve just set up and launched your shipping experiment!

</aside>

### Analyzing the results

1. To view real-time updates on the experiment, click on the analytics icon for the experiment on the Intelligems app
   page

   ![Screen Shot 2022-01-06 at 12.21.16 PM (2).png](/img/shipping-testing/Screen_Shot_2022-01-06_at_12.21.16_PM_(2).png)


1. View your real-time test results in the Intelligems dashboard

   ![Screen Shot 2022-01-06 at 12.25.06 PM (2).png](/img/shipping-testing/Screen_Shot_2022-01-06_at_12.25.06_PM_(2).png)

### Ending your shipping test

1. When you are ready to end your shipping test, reconfigure your shipping rates within Shopify and remove Intelligems
   as the shipping rates provider

   ![Screen Shot 2022-02-01.png](/img/shipping-testing/Screen_Shot_2022-02-01.png)


1. Navigate to the Intelligems app, locate the shipping experiment that you would like to end and click the “Stop”
   button. You will still be able to access the results dashboard after the experiment has ended

   ![Screen Shot 2022-02-01 at 5.53.32 PM.png](/img/shipping-testing/Screen_Shot_2022-02-01_at_5.53.32_PM.png)

## The Intelligems Progress Bar Component

### Example 1: Under the Free Shipping threshold

![Untitled](/img/shipping-testing/Untitled.png)

### Example 2: Over the Free Shipping threshold

![Untitled](/img/shipping-testing/Untitled-1.png)

### Example 3: Under the Cart Minimum Threshold

![Untitled](/img/shipping-testing/Untitled-2.png)

## Configuration

### Required Steps

1. To add the Shipping Progress Bar to your store, paste the following line into your store’s theme at the location you
   wish to place the component. Be sure not to accidentally nest the component inside divs it shouldn’t be in or that
   may modify formatting.

   `<ig-shipping-progress-container></ig-shipping-progress-container>`

2. This plugin accesses your site’s cart subtotal through ID tags. Inspect the cart subtotal text on your site and look
   for a nearby parent element with an ID tag, such as below:

![Untitled.png](/img/shipping-testing/Untitled-3.png)

1. In this example, the id is `cart-price`. Copy this id and set `subtotalElementId` (below) to this value.
2. If no **nearby** element has an ID, please add one called `igSubtotal`. In the example below, any of the spans shown
   would be acceptable places for the ID (although the closer to the text, the better).

![Untitled.png](/img/shipping-testing/Untitled-4.png)

### Optional Steps

Several styling options are available, all of which are optional. All are case and type sensitive. These may be on the
settings page in `JSON` format. An example of the format, with the default values, is shown at the end of this section.

1. **`subtotalElementId`** (`string`) **:** Specify the element ID which shows the current cart total. This will likely
   be in the cart slide out. If no ID exists, set the closest div’s ID to `igSubtotoal`.
2. `**defaultThreshold`** (`string`) **:** The *default* free shipping threshold to show if no live experiments are
   found. In other words, you may continue using this component even without live experiments. To hide the component
   when no live experiments are found, set to 0.
3. **`minimumPurchaseAmount`** (`string`) **:** Show a warning if the current cart subtotal is below a store minimum.
   Set to 0 disable.
4. `**underMinimumText**` (`string`) **:** Text to show when the cart minimum has not been met. Use `#MINIMUM` inside
   your string as a placeholder for the minimum dollar amount.

   The default message is: `OOPS! THERE IS A $#MINIMUM MINIMUM TO CHECKOUT`

5. `**underThresholdText**`(`string`) : Text to show when the total cart value is less than the free shipping threshold.
   Use `#REMAINING` in your text as a placeholder for the dollar amount remaining. The default message is:

   The default message is: `ALMOST THERE! ADD $#REMAINING TO UNLOCK FREE SHIPPING!`

6. `**overThresholdText`** (`string`) : Text to show when the total care value is greater than or equal to the free
   shipping threshold.

   The default message is: `CONGRATS! YOU HAVE UNLOCKED FREE STANDARD SHIPPING!`

7. **`maxWidth`** (`string`)  **:** The maximum width of the component.
8. `**textColor`** (`string`)  **:**  The color of the text.
9. `**textSize`** (`string`)  **:**  The size of the text.
10. `**underMinimumBackgroundColor`** (`string`)  **:** The background color of the ‘under minimum’ message
    from Example 3.
11. `**progressBarBackgroundColor`** (`string`)  **:** The color of the unfilled portion of the progress bar.
12. **`progressBarCompletedColor`**(`string`) : The color of the filled portion of the progress bar.
13. **`progressBarHeight`** (`string`) : The height of the progress-bar bar.

### Example JSON Settings

```json
{
  "defaultThreshold": 0,
  "minimumPurchaseAmount": 0,
  "subtotalElementId": "igSubtotal",
  "maxWidth": "100%",
  "underMinimumText": "OOPS! THERE IS A $#MINIMUM MINIMUM TO CHECKOUT",
  "underThresholdText": "ALMOST THERE! ADD $#REMAINING TO UNLOCK FREE SHIPPING!",
  "overThresholdText": "CONGRATS! YOU HAVE UNLOCKED FREE STANDARD SHIPPING!",
  "textSize": "12px",
  "textColor": "inherit",
  "underMinimumBackgroundColor": "#ff6666",
  "progressBarBackgroundColor": "#eee",
  "progressBarCompletedColor": "#0013BC",
  "progressBarHeight": "10px"
}
```