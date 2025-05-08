function formatString(input: string, toUpper?: boolean): string {
  if (toUpper === false) {
    return input.toLowerCase();
  } else {
    return input.toUpperCase();
  }
}

const books = [
  { title: "Book A", rating: 4.5 },
  { title: "Book B", rating: 3.2 },
  { title: "Book C", rating: 5.0 },
];
function filterByRating(
  items: { title: string; rating: number }[]
): { title: string; rating: number }[] {
  const result = items.filter((item) => item["rating"] >= 4);
  return result;
}

function concatenateArray<T>(...arr: T[][]): T[] {
  let result: T[] = [];
  arr.forEach((item) => (result = result.concat(item)));
  return result;
}

class Vehicle {
  protected _make: string;
  year: number;

  constructor(_make: string, year: number) {
    this._make = _make;
    this.year = year;
  }

  getInfo(): string {
    return `Make: ${this._make}, Year: ${this.year}`;
  }
}
class Car extends Vehicle {
  private _model: string;
  constructor(_make: string, year: number, _model: string) {
    super(_make, year);
    this._model = _model;
  }
  getModel(): string {
    return `Model: ${this._model}`;
  }
}
const myCar = new Car("Toyota", 2020, "Corolla");

function processValue(value: string | number): number | undefined {
  if (typeof value === "string") {
    return value.length;
  } else if (typeof value === "number") {
    return value * 2;
  }
}

interface Product {
  name: string;
  price: number;
}

function getMostExpensiveProduct(
  products: Product[]
): Product | null | undefined {
  if (!products || products.length === 0) return null;
  let highestPrice = -Infinity;

  products.forEach((obj) => {
    highestPrice = Math.max(obj.price, highestPrice);
  });
  for (const obj of products) {
    if (obj.price === highestPrice) {
      return obj;
    }
  }
}
const products = [
  { name: "Pen", price: 10 },
  { name: "Notebook", price: 25 },
  { name: "Bag", price: 50 },
];

enum Day {
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
  Sunday,
}
function getDayType(day: Day): string {
  if (day === Day.Sunday || day === Day.Saturday) {
    return "Weekend";
  } else {
    return "Weekday";
  }
}

async function squareAsync(n: number): Promise<number | unknown> {
  const result = new Promise((resolve, reject) => {
    setTimeout(() => {
      if (!(n < 0)) {
        resolve(n * n);
      } else {
        reject(new Error("Negative number not allowed"));
      }
    }, 1000);
  });
  return result;
}
squareAsync(-10).then(console.log).catch(console.error);
