//
//  PeopleList.swift
//  Lab5
//
//  Created by Hoang, Minh on 4/4/16.
//  Copyright © 2016 Hoang, Minh. All rights reserved.
//

import Foundation

class PeopleList {
    
    var root: Person?
    var size: Int = 0

    func add(person: Person) {
        
        if isEmpty() || person < root {
            addAtRoot(person)
        }
        else {
            // find the person 
            var runner = root!
            while (runner.next != nil && person > runner) {
                runner = runner.next!
            }
        }
        
        size += 1
    }
    
    func addAtRoot(person: Person) {
        
        if isEmpty() {
            root = person
        }
        else {
            person.next = root
            root = person
        }
        size += 1
    }
    
    func isEmpty() -> Bool {
        return size == 0;
    }
    
}

