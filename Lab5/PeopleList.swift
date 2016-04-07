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
            var runner: Person? = root
            var previous: Person! = root
            
            while runner != nil && person >= runner {
                if (runner == person) {
                    print("IN - Duplicate \(person.getDisplayName()). Failed to add the person to the list.")
                    return
                }
                previous = runner!;
                runner = runner!.next
            }
            
            previous!.next = person; // wrapped because the loop always going to run once (else we have already added before root).
            person.next = runner;
            
            if runner == nil {
                print("IN - Added \(person.getDisplayName()) to the end of the list.");
            }
            else {
                print("IN - Added \(person.getDisplayName()) between \(previous!.getDisplayName()) and \(runner!.getDisplayName())")
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
        print("IN - Added \(person.getDisplayName()) to the beginning of the list.");
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
                    print("DE - Removed \(runner!.getDisplayName()).");
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
            print("---Print everyone in the list---")
            var runner: Person? = root
            
            while runner != nil {
                printPerson(runner!)
                runner = runner!.next
            }
            print("---Finished printing------------")
        }
    }
    
    func printInfo(id: Int, name: String) {
        printPeopleWith(" id: \(id) and name: \(name)", isMatch: {
            $0.id == id && $0.name == name
        })
    }
    
    func printTitle(title: String) {
        printPeopleWith(" title: \(title)", isMatch: {
            $0.title == title
        })
    }
    
    func printDepartment(department: String) {
        printPeopleWith(" department: \(department)", isMatch: {
            $0.department == department
        })

    }
    
    func printPeopleWith(attribute: String, isMatch: (Person) -> Bool) {
        if isEmpty() {
            print("PA - List is empty.")
        }
        else {
            print("---Print everyone with \(attribute)-----")
            var runner: Person? = root
            var isFound: Bool = false
            
            while runner != nil {
                if isMatch(runner!) {
                    printPerson(runner!)
                    isFound = true
                }
                runner = runner!.next
            }
            
            if !isFound {
                print("Nobody with with \(attribute) was found.")
            }
            print("---Finished printing with \(attribute)--")
        }
    }
    
    func updateTitle(id: Int, name: String, updating: String) {
        update(id, name: name, set: {
            print("UT - Updated title of \($0.id) from \($0.title) to \(updating)")
            $0.title = updating
        })
    }
    
    func updateDepartment(id: Int, name: String, updating: String) {
        update(id, name: name, set: {
            print("UD - Updated department of \($0.id) from \($0.department) to \(updating)")
            $0.department = updating
        })
    }
    
    func updatePay(id: Int, name: String, updating: String) {
        update(id, name: name, set: {
            print("UP - Updated payment of \($0.id) from \($0.pay) to \(updating)")
            $0.pay = Double(updating)!

        })
    }
    
    func update(id: Int, name: String, set: (Person) -> Void) {
        if isEmpty() {
            print("UPDATE - List is empty.")
        }
        else {
            var runner: Person? = root!
            
            // stop when runner reaches end of list or find somebody with provided name
            while runner != nil {
                if runner!.id == id && runner!.name == name {
                    set(runner!)
                    return
                }
                runner = runner!.next
            }
            
            // if we cannot find anyone
            print("UPDATE - Cannot update \(id) with name: \(name). Provided id and name does not match anyone in the list.");
        }
    }
    
    func isEmpty() -> Bool {
        return size == 0;
    }
    
    func printPerson(person: Person) {
        print("\(person.getDisplayName()) \t\(person.name)           \t\(person.department)       \t\(person.title)    \t\t\(person.pay)")
    }
}
