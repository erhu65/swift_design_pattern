var products = [("Kayak", 275.0, 10), ("Lifejacket", 48.95, 14), ("Soccer Ball", 19.5, 32)];

func calculateTax(product:(String, Double, Int)) -> Double {
    return product.1 * 0.2;
}

func calculateStockValue(tuples:[(String, Double, Int)]) -> Double {
    return tuples.reduce(0, {(total, product) -> Double in
    return total + (product.1 * Double(product.2))
    }); }
println("Sales tax for Kayak: $\(calculateTax(products[0]))");
println("Total value of stock: $\(calculateStockValue(products))");