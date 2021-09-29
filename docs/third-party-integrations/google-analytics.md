---
title: Google Analytics
---

# Integrate with Google Analytics

Integration with Google Analytics is possible by using [custom dimensions](https://support.google.com/analytics/answer/2709829?hl=en#zippy=%2Cin-this-article). 
Custom dimensions allow you to filter and segment your analytics based on which group they were in.

In order to work best, Intelligems requires a new custom dimension per experiment. These instructions will walk you through creating the new custom dimension in your GA account and setting it up with intelligems.

## Create a Custom Dimension in Google Analytics

Log into your google analytics account. On the settings page in the section under "Property", you should see an option called Custom Definitions > Custom Dimensions.

![Custom Dimensions Setting](/img/Custom_Dimensions_Settings.png)

Create a new custom dimension.  
- Name: You can name it however you want, our suggestion would be the same as the name of the experiment. 
- Scope: make sure to choose `User` to ensure that the dimension is tracked across sessions for the same user in case they convert at a later point in time.
- Active: Make sure the box is checked before the test goes live.

![New Custom Dimensions](/img/Custom_Dimension_New.png)

## Integrate with Intelligems

Note the index of the new custom dimension in GA. 

For now, please just let us know what the index is and in the future we'll enable setting this in the intelligems dashboard.