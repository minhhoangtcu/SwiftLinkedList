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
            var runner: Person? = root!.next
            var previous: Person! = root
            
            while runner != nil && person >= runner {
                if (runner == person) {
                    print("IN - Duplicate \(person.id). Failed to add the person to the list.");
                }
                previous = runner!;
                runner = runner!.next
            }
            
            previous!.next = person; // wrapped because the loop always going to run once (else we have already added before root).
            person.next = runner;
            
            if runner == nil {
                print("IN - Added \(person.id) to the end of the list.");
            }
            else {
                print("IN - Added \(person.id) between \(previous!.id) and \(runner!.id)");
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
    
    func remove(id: Int) {
        
        if isEmpty() {
            print("DE - Cannot remove \(id) because list is empty.");
        }
        else if root!.id == id {
            root = root!.next
            size -= 1
            print("DE - Removed \(id) at the head of list.");
        }
        else {
            var runner: Person? = root!.next
            var previous: Person! = root
            
            while runner != nil {
                if runner!.id == id {
                    previous!.next = runner!.next
                    print("DE - Removed \(id).");
                    size -= 1
                    return;
                }

                previous = runner!
                runner = runner!.next;
            }
            
            // reached end of list
            print("DE - Cannot remove \(id). Provided id does not match anyone in the list.");
        }
    }
    
    func printAll() {
        if isEmpty() {
            print("PA - List is empty.")
        }
        else {
            print("PA - Print everyone in the list")
            var runner: Person? = root!.next
            
            while runner != nil {
                print("\(runner!.id) \t\(runner!.name) \t\(runner!.department) \t\(runner!.title) \t\(runner!.pay)")
                runner = runner!.next
            }
            print("PA - Finished printing")
        }
    }
    
    func isEmpty() -> Bool {
        return size == 0;
    }
    
}

