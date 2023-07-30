//
//  Models.swift
//  Alef
//
//  Created by Raiden Yamato on 26.07.2023.
//


import UIKit

public struct MockStruct: Hashable, Equatable {
    let integer: Int
    let identifier = UUID().uuidString
    
    static var mock: [MockStruct] {
        var array: [MockStruct] = []
        for i in 1..<2 {
            array.append(MockStruct(integer: i))
        }
        return array
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    public static func == (lhs: MockStruct, rhs: MockStruct) -> Bool {
        return lhs.identifier == rhs.identifier
    }
 
}
