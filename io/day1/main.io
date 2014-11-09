// For learning to run program from file
// => io main.io
dog := Object clone
dog name := "Spunky"
dog printName := method(name println)
dog printName

// Execute code in a given slot given its name
slotName := "printName"
dog perform(slotName)
