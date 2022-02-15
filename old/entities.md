---
title: Entities
sidebar_position: 2
---


### Experiment
An experiment object:
 - `id` A unique id for the experiment
 - `name` The name of the experiment
 - `isPreview` A boolean if the test is in preview, which limits it to Shopify preview themes

### TestGroup
A test group within an experiment:
 - `id` A unique ID for the test group
 - `name` The name of the test group
 - `percentage` The current percentage of traffic being filtered into the group
 - `isControl` Boolean value whether or not this is the control group.