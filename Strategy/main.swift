let sequence = Sequence(1, 2, 3, 4);
sequence.addNumber(10);
sequence.addNumber(20);
let sum = sequence.compute(ALGORITHM.ADD);
println("Sum: \(sum)");
let multiply = sequence.compute(ALGORITHM.MULTIPLY);
println("Multiply: \(multiply)");