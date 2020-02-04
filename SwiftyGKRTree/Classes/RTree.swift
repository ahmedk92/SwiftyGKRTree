//
//  RTree.swift
//  Pods-SwiftyGKRTree_Example
//
//  Created by Ahmed Khalaf on 2/4/20.
//

import GameKit
import CoreGraphics

open class RTree<T> {
    
    open var queryReserve: Int {
        get {
            return gkRTree.queryReserve
        }
        
        set {
            gkRTree.queryReserve = newValue
        }
    }

    
    public init(maxNumberOfChildren: Int) {
        gkRTree = GKRTree(maxNumberOfChildren: maxNumberOfChildren)
    }

    
    /**
     * Adds an element with the specified bounding rect to this RTree.  The supplied splitting strategy is used if the node this element would be added to needs to be split.
     *
     * @param element the element to be added
     * @param boundingRect the bounding rect of the element to be added
     * @param splitStrategy the splitting strategy to be used if the node this element would be added to needs to be split
     */
    open func add(element: T, boundingRect: CGRect, splitStrategy: GKRTreeSplitStrategy) {
        let nsObject: NSObject
        if let element = element as? NSObject {
            nsObject = element
        } else {
            nsObject = NSObjectBox(element)
        }
        gkRTree.addElement(nsObject, boundingRectMin: boundingRect.minPoint, boundingRectMax: boundingRect.maxPoint, splitStrategy: splitStrategy)
    }
    
    /**
     * Queries all the elements that are in this RTree within the given bounding rect.
     *
     * @param boundingRect the bounding rect
     *
     * @return an Array of all of the elements that fall within the query rect
     */
    open func elements(in boundingRect: CGRect) -> [T] {
        return gkRTree.elements(inBoundingRectMin: boundingRect.minPoint, rectMax: boundingRect.maxPoint).map({ nsObject in
            if let box = nsObject as? NSObjectBox<T> {
                return box.value
            } else {
                return nsObject as! T
            }
        })
    }

    private let gkRTree: GKRTree<NSObject>
}

public extension RTree where T == NSObject {
    /**
     * Removes an element with the specified bounding rect from this RTree.
     *
     * @param element the element to be removed
     * @param boundingRect the bounding rectangle of the element to be removed
     */
    func remove(element: T, boundingRect: CGRect) {
        gkRTree.removeElement(element, boundingRectMin: boundingRect.minPoint, boundingRectMax: boundingRect.maxPoint)
    }

}

public extension RTree where T: Equatable {
    /**
     * Removes an element with the specified bounding rect from this RTree.
     *
     * @param element the element to be removed
     * @param boundingRect the bounding rectangle of the element to be removed
     */
    func remove(element: T, boundingRect: CGRect) {
        gkRTree.removeElement(NSObjectBoxEquatable(element), boundingRectMin: boundingRect.minPoint, boundingRectMax: boundingRect.maxPoint)
    }
}

private class NSObjectBox<T>: NSObject {
    init(_ value: T) {
        self.value = value
    }
    
    let value: T
}

private class NSObjectBoxEquatable<T: Equatable>: NSObjectBox<T> {
    override func isEqual(_ object: Any?) -> Bool {
        if self === object as AnyObject {
            return true
        }
        
        guard let object = object as? NSObjectBoxEquatable<T> else { return false }
        
        return value == object.value
    }
}

private extension CGRect {
    var minPoint: vector_float2 { vector_float2(Float(minX), Float(minY)) }
    var maxPoint: vector_float2 { vector_float2(Float(maxX), Float(maxY)) }
}
