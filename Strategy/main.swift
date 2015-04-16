let sequence = Sequence(1, 2, 3, 4);
sequence.addNumber(10);
sequence.addNumber(20);
let sumStrategy = SumStrategy();
let multiplyStrategy = MultiplyStrategy();
let sum = sequence.compute(sumStrategy);
println("Sum: \(sum)");
let multiply = sequence.compute(multiplyStrategy);
println("Multiply: \(multiply)");