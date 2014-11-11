Io
===

Reference: http://iolanguage.org/scm/io/docs/reference/

## Summary

Io is a lightweight prototype language with influence from Smalltalk. It is simple, powerful, and elegant. It's everything I like about Javascript mixed with Smalltalk's message passing. I think it would be really nice for building tools and general scripting

## Notes

* Prototype language (i.e. Objects have a prototype chain which they delegate missing messages to)
* Has message passing
  * `sender`, `target`, `arguments`
* Objects have "slots"
* Methods are `Block`s
* Collections: `List`, `Map`
* Has `nil` object
* Has singleton objects (cloning returns singleton value)
* Three assignment operatrs `= := ::=`
  * `::=` creates a slot, a setter (`setXYZ`), and assigns slot
  * `:=` creates and assigns slot
  * `=` assigns slot

* Conventions
  * Types start with uppercase
  * The global object space is `Lobby`
  * Commas between arguments are mandatory (not using commas will pipe/chain the next message)
  * can use `_` in REPL to get last evaluated
  * Boolean operators are `and or` which work like traditional `|| &&`
  * `nil` evaluates to `false` and `0` evaluates to `true`

* Examples:
```io
// Objects have slots
Vehicle := Object clone
Vehicle description := "Takes you places"
Vehicle slotNames

// Modifying slots
Vehicle description = "Drives around" // Doesn't throw because slot was assigned with :=
Vehicle somethingElse = "whatever" // Throws because slot DNE

// Adding methods to objects
ferarri := Vehicle clone
Vehicle drive := method("Vroom" println)
ferrari drive

// Reflection
ferrari getSlot("drive")
ferrari proto

// Global object space
Lobby

// Collections
vals := list(1, 2, 3) // Convenience method for "List clone"
vals average // TODO: how is average calculated? message passing??
vals sum
vals at(1)
vals append(4)
vals prepend 0
vals isEmpty

hash := Map clone
hash atPut("home", "Graceland")
hash at("home")
hash asObject
hash asList
hash keys
hash size

// Singletons
Highlander := Object clone
Highlander clone := Highlander // := syntax is optional, could use = because clone is already a defined slot

// Operators
OperatorTable
OperatorTable addOperator("xor", 11)
true xor := method(bool, if(bool, false, true))
false xor := method(bool, if(bool, true, false))

// Messages
call sender
call target
call message arguments
call message name

// Control
if(expression, trueCondition, falseCondition)
if(express) then() else()
for(i, initial, until, [iter], do)
loop(foreverDo)
while(expression, do; iter)
```
