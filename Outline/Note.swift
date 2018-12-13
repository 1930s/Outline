//
//  Note+CoreDataClass.swift
//
//
//  Created by Ash Zade on 2017-12-31.
//
//

import UIKit
import Foundation
import CoreData

public class Note {

    // Properties
    var noteTitle: String
    var groupItems = [[String]]()
    var groups = [String]()
    var updatedDate = Date()

    init?(noteTitle: String, groupItems: [[String]], groups: [String], date: Date) {

        if groups.isEmpty || groupItems.isEmpty {
            return nil
        }

        self.noteTitle = noteTitle
        self.groupItems = groupItems
        self.groups = groups
        self.updatedDate = date
    }
    
    func addGroup(groupName: String) {
        groups.append(groupName)
    }
}

class Item: NSObject, NSCoding {
    var value: String
    var children: [Item] = []
    weak var parent: Item?
    
    init(value: String) {
        self.value = value
    }
    
    func add(child: Item) {
        children.append(child)
        child.parent = self
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let value = aDecoder.decodeObject(forKey: "value") as! String
        self.init(value: value)
    }
    
    func encode(with aCoder: NSCoder){
        aCoder.encode(value, forKey: "value")
    }
}

class DisplayGroup: NSObject, NSCoding {
    var indentationLevel: Int
    var item: Item?
    var hasChildren: Bool
    var done: Bool
    
    init(indentationLevel: Int, item: Item, hasChildren: Bool, done: Bool ) {
        self.indentationLevel = indentationLevel
        self.item = item
        self.hasChildren = hasChildren
        self.done = done
    }
    
    required init(coder aDecoder: NSCoder)
    {
        self.indentationLevel = aDecoder.decodeInteger(forKey: "indentationLevel")
        self.hasChildren = aDecoder.decodeBool(forKey: "hasChildren")
        self.item = aDecoder.decodeObject(forKey: "item") as! Item
        self.done = aDecoder.decodeBool(forKey: "done")
    }
    
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(item, forKey: "item")
        aCoder.encode(hasChildren, forKey: "hasChildren")
        aCoder.encode(indentationLevel, forKey: "indentationLevel")
        aCoder.encode(done, forKey: "done")
    }
}
