## 2. What is the use of the `keyof` keyword in TypeScript?

`keyof` is an operator in TypeScript which gives us the union of all properties or keys of an object type as string literal types.  
It is really useful to ensure type safety while creating functions that require object keys.

### Example:
```ts
interface Vehicle {
    name: string;
    category: string;
}

function getVal(obj: Vehicle, key: keyof Vehicle) {
    return obj[key];
}

// keyof Vehicle contains "name" | "category"
const car: Vehicle = { name: "Toyota", category: "Land" };
console.log(getVal(car, "name")); // Output: Toyota



