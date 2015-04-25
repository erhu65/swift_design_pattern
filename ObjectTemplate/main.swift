var products = [
    Product(name: "Kayak", price: 275, stock: 10),
    Product(name: "Lifejacket", price: 48.95, stock: 14),
    Product(name: "Soccer Ball", price: 19.5, stock: 32)];

func calculateTax(product:Product) -> Double {
    return product.price * 0.2;
}
func calculateStockValue(productsArray:[Product]) -> Double {
    return productsArray.reduce(0, {(total, product) -> Double in
    return total + (product.price * Double(product.stock))
    });
}


println("Sales tax for Kayak: $\(calculateTax(products[0]))");
println("Total value of stock: $\(calculateStockValue(products))");