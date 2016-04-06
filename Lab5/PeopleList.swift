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
            var runner: Person! = root
            var previous: Person?
            
            while runner != nil && person >= runner {
                if (runner == person) {
                    print("IN - Duplicate \(person.id). Failed to add the person to the list.");
                }
                previous = runner;
                runner = runner.next
            }
            
            previous!.next = person; // wrapped because the loop always going to run once (else we have already added before root).
            person.next = runner;
            
            if runner == nil {
                print("IN - Added \(person.id) to the end of the list.");
            }
            else {
                print("IN - Added \(person.id) between \(previous!.id) and \(runner.id)");
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
        print("IN - Added \(person.id) to the beginning of the list.");
        size += 1
    }
    
    func isEmpty() -> Bool {
        return size == 0;
    }
    
}

