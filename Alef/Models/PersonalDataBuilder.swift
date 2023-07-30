//
//  File.swift
//  Alef
//
//  Created by Raiden Yamato on 28.07.2023.
//

import Foundation


public class PersonalDataBuilder {
    public var name = ""
    public var age = ""
    public var kids = [CHildBuider()]
    
    public func addNewChild() {
        let child = CHildBuider()
        kids.append(child)
    }
    
    public func removeChild(at index: Int) {
        kids.remove(at: index)
    }
    
    
    public func removeAll() {
        kids.removeAll()
    }
}



public class CHildBuider: Hashable {
    
    public var name = ""
    public var age = ""
    
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    public static func == (lhs: CHildBuider, rhs: CHildBuider) -> Bool {
        lhs.identifier == rhs.identifier
    }
    
    private let identifier = UUID()
    
    
}
