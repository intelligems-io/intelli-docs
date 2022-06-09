---
title: User
---

# `user`

```ts
window.igData.user
```

The following functions are available in `igData.user`:
- [igId](#igId)
- [getExperiments()](#getExperiments)
- [getTestGroup([experimentId])](#getTestGroup)
- [getTestGroupName([experimentId])](#getTestGroupName)
---

## user.igId {#igId}
:::info Example

```ts
console.log(igData.user.igId);

"ig_71e855a9313945b63eb35e0abd5b63361d48"
```

:::
#### Returns
```ts
igId: string
```
> The user's Intelligems IgId id.



---

## user.getExperiments() {#getExperiments}
:::info Example

```ts
console.log(igData.user.getExperiments());

[
    {
        "id": "8bce9d31-cd20-4f4a-a070-a6970c7e9803",
        "name": "Price Test",
        "isPreview": true
    }
]
```

:::

#### Returns
```ts
experiments: { 
    id: string;
    name: string;
    isPreview: boolean
}[] | null;
```
> List of experiments the user is in.



---

## user.getTestGroup([experimentId]) {#getTestGroup}
:::info Example

```ts
console.log(igData.user.getTestGroup("8bce9d31-cd20-4f4a-a070-a6970c7e9803"))

{
    id: "8cead46f-a9d1-41dd-a864-86fc718ee133", 
    name: "Control Group",
    percentage: 33,
    isControl: true
}
```

:::
#### Parameters
```ts
experimentId: string
```

#### Returns
```ts
testGroup: {
    id: string;
    name: string;
    percentage: number;
    isControl: boolean;
} | null
```
> The user's test group based on experiment ID




---

## user.getTestGroupName([experimentId]) {#getTestGroupName}
:::info Example

```ts
igData.user.getTestGroupName("8bce9d31-cd20-4f4a-a070-a6970c7e9803")

"Control Group"
```

:::


#### Parameters
```ts
experimentId: string
```

#### Returns
```ts
testGroupName: string
```
> User's test group name based on experiment ID.



