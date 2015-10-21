
# TypeClasses Mob

## Exercises

### Goal # 1 - Learn How to implement instances of already existing typeclasses

In the file [User.hs](app/User.hs), implement the following typeclasses without using "deriving"

- Show
- ToJSON
- FromJSON
- Arbitrary

### Goal # 2 - Learn How to create your own typeclasses

Create a new typeclass

A suggestion is to create a typeclass called `Validate` that will have one function `validate`.
which can be used to validate any datatype according to its domain.
Validating the User record type may require checking the email to be something like "abc@def.com".
Or it may require that the password is a certain length.
You may want to express in the type system that a datatype has been validated
by wrapping it in some kind of validation type.
perhaps `Maybe` or even a custom datatype like `Validation a = Valid a | Invalid`

### Goal # 3 - Learn How Typeclasses can solve the expression problem

The expression problem is a new name for an old problem. The goal is to define a datatype by cases, where one can add new cases to the datatype and new functions over the datatype, without recompiling existing code, and while retaining static type safety (e.g., no casts). [[reference]](https://en.wikipedia.org/wiki/Expression_problem)

Look at the following examples to convince yourself of the problem.

**Functional Programming Example**

```haskell
-- Cases for a type
data Shape = Circle { radius :: Double }
           | Square { side :: Double }

-- Operation on the type shape
area :: Shape -> Double
area (Circle r) = 3.14 * r * r
area (Square s) = s * s

-- Adding a new function does not require changing any old code

perimiter :: Shape -> Double
perimiter (Circle r) = 2 * 3.14 * r
perimiter (Square s) = s * 4

-- The bad part is that if we ever have to add a new shape we need to update all our old functions
```

Summary

- Easy to add new functions
- Adding new cases requires changing the code of old functions

**Object Oriented Programming Example**

```java

    interface Shape {
        Double area();
    }

    class Circle extends Shape {
        private Double radius;

        Double area() {
            return 3.14 * radius * radius;
        }
    }

    class Square extends Shape {
        private Double side;

        Double area() {
            return side * side;
        }
    }

    // Adding new cases is easy and doesn't require any changes to old code

    class Rectangle extends Shape {

        private Double length;
        private Double height;

        Double area() {
            return length * height;
        }
    }

    // The bad part here is that if we want to add a new function we would have to update all of our old objects

```

Summary

- Easy to add new cases
- Adding new functions requires changing the code of old objects

Now use typeclasses to solve this problem.

1. Define the Shapes Circle, and Square
2. Define a typeclass for computing the area of a shape
3. Implement an instance of that type class for each shape
4. Define the Rectangle shape
5. Add another typeclass for computing the perimeter
6. Create instances of that typeclass for all shapes

Notice how doing this with typeclasses never required going back to update previous code, and we still get to be type safe!

### Goal # 4 - Learn How to use the most basic, and ubiquitous typeclasses

Knowing how these typeclasses work under the hood is not required but it is definitely recommended.
For that I refer you to [typeclassopedia](https://wiki.haskell.org/Typeclassopedia).

You should start with typeclassopedia but if you are struggling to get through it then here are some ideas.

**Learning Functor**

Practice with some basic data types that implement Functor e.g. `Maybe` and `Either`.
Practice using fmap to chain functions to these datatypes.

**Learning Applicative**

Practice using functions like `<*>` and `<$>` to chain functions with `Maybe` and `Either`
These functions are commonly used with parsing libraries like Aeson, and Parsec, so building parsers can give you some more practice.

**Learning Monad**

Practice using functions like `>>=`, `>>`, and `return` with `Maybe` and `Either`
