
class Sequence {
    private var numbers:[Int];
    init(_ numbers:Int...) {
        self.numbers = numbers;
    }
    func addNumber(value:Int) {
        self.numbers.append(value);
    }
    func compute() -> Int {
        return numbers.reduce(0, combine: {$0 + $1});
    }
}