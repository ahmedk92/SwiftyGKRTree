import XCTest
import SwiftyGKRTree

class Tests: XCTestCase {

    func test_NSObjectElementFound() {
        
        let expectedElement = "Ahmed"
        
        let tree = RTree<String>(maxNumberOfChildren: 10)
        tree.add(element: "Ali", boundingRect: CGRect(x: 0, y: 0, width: 10, height: 20), splitStrategy: .halve)
        tree.add(element: expectedElement, boundingRect: CGRect(x: 100, y: 100, width: 10, height: 10), splitStrategy: .halve)
        
        XCTAssertEqual(tree.elements(in: CGRect(x: 50, y: 50, width: 100, height: 100)), [expectedElement])
    }
    
    func test_NSObjectElementNotFound() {
        
        let tree = RTree<String>(maxNumberOfChildren: 10)
        tree.add(element: "Ali", boundingRect: CGRect(x: 0, y: 0, width: 10, height: 20), splitStrategy: .halve)
        tree.add(element: "Ahmed", boundingRect: CGRect(x: 100, y: 100, width: 10, height: 10), splitStrategy: .halve)
        
        XCTAssertEqual(tree.elements(in: CGRect(x: 50, y: 50, width: 100, height: 10)), [])
    }
    
    struct MyValue: ExpressibleByIntegerLiteral, Equatable {
        init(integerLiteral value: Int) {
            int = value
        }
        
        let int: Int
    }
    
    func test_ElementFound() {
        
        let expectedElement: MyValue = 1
        
        let tree = RTree<MyValue>(maxNumberOfChildren: 10)
        tree.add(element: 2, boundingRect: CGRect(x: 0, y: 0, width: 10, height: 20), splitStrategy: .halve)
        tree.add(element: expectedElement, boundingRect: CGRect(x: 100, y: 100, width: 10, height: 10), splitStrategy: .halve)
        
        XCTAssertEqual(tree.elements(in: CGRect(x: 50, y: 50, width: 100, height: 100)), [expectedElement])
    }
    
    func test_ElementNotFound() {
        
        let tree = RTree<Int>(maxNumberOfChildren: 10)
        tree.add(element: 1, boundingRect: CGRect(x: 0, y: 0, width: 10, height: 20), splitStrategy: .halve)
        tree.add(element: 2, boundingRect: CGRect(x: 100, y: 100, width: 10, height: 10), splitStrategy: .halve)
        
        XCTAssertEqual(tree.elements(in: CGRect(x: 50, y: 50, width: 100, height: 10)), [])
    }
}
