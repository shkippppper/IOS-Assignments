//
//  UnitTestingAssignmentTests.swift
//  UnitTestingAssignmentTests
//
//  Created by Akaki Titberidze on 12.05.24.
//

import XCTest
@testable import UnitTestingAssignment

final class UnitTestingAssignmentTests: XCTestCase {
    
    var testingModel: CartViewModel!

    override func setUpWithError() throws {
        super.setUp()
        testingModel = CartViewModel()
    }

    override func tearDownWithError() throws {
        testingModel = nil
        super.tearDown()
    }

    func testSelectedItemsQuantity() {
        let product1 = Product(id: 1, price: 10, selectedQuantity: 3)
        let product2 = Product(id: 2, price: 15, selectedQuantity: 2)
        testingModel.allproducts = [product1, product2]
        testingModel.addProduct(withID: 1)
        testingModel.addProduct(withID: 2)

        XCTAssertEqual(testingModel.selectedItemsQuantity, 5, "initial calc")

        if let index = testingModel.selectedProducts.firstIndex(where: { $0.id == 1 }) {
            testingModel.selectedProducts[index].selectedQuantity = 5
        }

        XCTAssertEqual(testingModel.selectedItemsQuantity, 7, "updated calc")
    }
    
    func testTotalPrice() {
        testingModel.allproducts = [Product(id: 1, price: 10, selectedQuantity: 2)]
        testingModel.addProduct(withID: 1)
        
        XCTAssertEqual(testingModel.totalPrice, 20)
    }

    
    func testAddProductWithID() {
        let product = Product(id: 1, price: 10, selectedQuantity: 1)
        testingModel.allproducts = [product]
        testingModel.addProduct(withID: 1)

        XCTAssertEqual(testingModel.selectedProducts.count, 1)
    }
    
    func testAddProductWithProductNewProduct() {
        let newProduct = Product(id: 1, price: 10, selectedQuantity: 2)

        testingModel.addProduct(product: newProduct)

        XCTAssertEqual(testingModel.selectedProducts.count, 1)
        XCTAssertEqual(testingModel.selectedProducts.first?.id, newProduct.id)
        XCTAssertEqual(testingModel.selectedProducts.first?.selectedQuantity, newProduct.selectedQuantity)
    }
    
    func testAddRandomProductDiversity() {
        testingModel.allproducts = [
            Product(id: 1, price: 10, selectedQuantity: 1),
            Product(id: 2, price: 15, selectedQuantity: 1),
            Product(id: 3, price: 20, selectedQuantity: 1),
            Product(id: 4, price: 25, selectedQuantity: 1),
            Product(id: 5, price: 30, selectedQuantity: 1)
        ]
        
        for _ in 0..<100 {
            testingModel.addRandomProduct()
        }

        let uniqueProductIDs = Set(testingModel.selectedProducts.map { $0.id })
        
        XCTAssertTrue(uniqueProductIDs.count > 1)
    }
    
    func testRemoveProduct() {
        let product = Product(id: 1, price: 10, selectedQuantity: 1)
        testingModel.selectedProducts = [product]
        testingModel.removeProduct(withID: 1)

        XCTAssertTrue(testingModel.selectedProducts.count == 0)
    }
    
    func testClearCart() {
        let product = Product(id: 1, price: 10, selectedQuantity: 1)
        testingModel.selectedProducts = [product, product]
        testingModel.clearCart()

        XCTAssertTrue(testingModel.selectedProducts.count == 0)
    }
    
}
