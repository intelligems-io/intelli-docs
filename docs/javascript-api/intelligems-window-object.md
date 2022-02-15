---
title: Intelligems Window Object

sidebar_position: 1
---

# Intelligems Window Object

For ease of use, Intelligems adds an object to the global window scope when the page loads. It primarily acts as a read
interface for configurations and session-specific A/B tests.

## API Details

The root level object is called `igData`. It should load immediately following the loading of your intelligems
javascript library. For information on how to load the javascript library into your Shopify theme,
see [Installing the App](shopify-integration/install-app.md).

### The User Object

The following functions are available in `igData.user`:

1. `igData.user.igId`: This returns the user's Intelligems `IgId` id.

    ```typescript title="Get IgId Example"
   console.log(igData.user.igId);
   // ig_71e855a9313945b63eb35e0abd5b63361d48
   ```

2. `igData.user.getExperiments`: This returns a list of experiments the user is in.

    ```typescript title="Get Experiments Interface"
    igData.user.getExperiments() => { id: string; name: string; isPreview: boolean }[] | null;
    ```

    ```typescript title="Get Experiments Example"
   console.log(igData.user.getExperiments());
   //  [{"id": "8bce9d31-cd20-4f4a-a070-a6970c7e9803", "name": "Price Test", "isPreview": true}]
    
    ```
3. `igData.user.getTestGroup`: This returns the user's test group based on experiment ID.
    ```typescript title="Get Test Group Interface"
    igData.user.getTestGroup(experimentId: string) => {id: string; name: string; percentage: number; isControl: boolean;} | null;
    ```

    ```typescript title="Get Test Group Example"
   console.log(igData.user.getTestGroup("8bce9d31-cd20-4f4a-a070-a6970c7e9803"))
   // {id: '8cead46f-a9d1-41dd-a864-86fc718ee133', name: 'Control Group', percentage: 33, isControl: true}
    ```

4. `igData.user.getTestGroupName`: This returns the user's test group name based on experiment ID.
    ```typescript title="Get Test Group Name Interface"
    igData.user.getTestGroupName(experimentId: string) => string | null;
    ```

    ```typescript title="Get Test Group Name Example"
   console.log(igData.user.getTestGroupName("8bce9d31-cd20-4f4a-a070-a6970c7e9803"))
   //  Control Group
    ```

### The Price Object

The following functions are available in `igData.price`:

1. `igData.price.getPriceByVariantId`: This returns the price for this product based on the user's test group and the
   product variant id. If the variant is not included in any experiment, null will be returned.

    ```typescript title="Get Price by Variant Id Interface"
    igData.user.getPriceByVariantId(variantId: string | number) => string | null;
    ```
    
    ```typescript title="Get Price by Variant Id Example"
   console.log(igData.user.getPriceByVariantId(32305433935974))
   //  89.95
    ```
2. `igData.price.getDiscountByVariantId`: This returns the discount for this user based on their test group and the
   product variant id. This discount is in cents.
    ```typescript title="Get Discount by Variant Id Interface"
    igData.user.getDiscountByVariantId(variantId: string | number) => string | null;
    ```

    ```typescript title="Get Discount by Variant Id Example"
   console.log(igData.user.getDiscountByVariantId(32305433935974))
   //  1005
    ```
3. `igData.price.getAltProductHandle`: This returns the duplicated product's handle based off the original product's
   handle.
    ```typescript title="Get Alt Product Handle Interface"
    igData.user.getAltProductHandle(productHandle: string, testGroupName?: string) => string | null;
    ```

    ```typescript title="Get Alt Product Handle Example"
   console.log(igData.user.getAltProductHandle("dutch-oven"))
   //  dutch-oven-1
    ```