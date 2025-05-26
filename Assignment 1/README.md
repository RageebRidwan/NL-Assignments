## 2. What is the use of the keyof keyword in TypeScript? Provide an example.
Answer: keyof is an operator in TypeScript which gives us the union of all properties or keys of an object type as string literal types. It is really useful to ensure type safety while creating functions that require object keys. Here is an example of using keyof operator:

interface Vehicle {
    name: string;
    category: string;
}

function getVal(obj: Vehicle, key: keyof Vehicle) {
    return obj[key];
}
// keyof Vehicle contains "name" | "category" .

const car: Vehicle = {name: "Toyota", category: "Land"};

console.log(getVal(car, "name")); // Output : Toyota


## 3. Explain the difference between any, unknown, and never types in TypeScript.
Answer: There are some key differences in the use cases of any, unknown and never types in TypeScript. Some of them are highlighted below:

any:
This is especially useful when migrating from our JS project to TS. Using any gives us the freedom to assign values of any datatype to a variable. Not only that, we can also reassign another value of a different datatype to an already defined variable. For example:

let value: any = "cat";

value = 100;

Here, reassigning 100 to this variable will not throw an error. We get the freedom to bypass all type-checks in TS by using any.

unknown:
unknown is nothing but a safer alternative to any. It allows us to bypass type checking while assigning values or passing them as arguments, but it forces us to perform a type check before using the value. Otherwise, an error will be thrown. For example:

let value: unknown = "cat";

if (typeof value === "string"){
    console.log(value); // Without type narrowing, this will not work
}

never:
The never type is typically used with functions that throw errors or do not finish executing (example: stuck in an infinite loop). For example:

function randomFunc(value: string): never{
    throw new Error("This is an error");
}




