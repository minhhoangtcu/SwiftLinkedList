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
                    print("IN - Duplicate \(person.getDisplayName()). Failed to add the person to the list.");
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
                print("IN - Added \(person.getDisplayName()) between \(previous!.getDisplayName()) and \(runner!.getDisplayName())");
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
                print("\(runner!.getDisplayName()) \t\(runner!.name)           \t\(runner!.department)     \t\(runner!.title) \t\(runner!.pay)")
                runner = runner!.next
            }
            print("---Finished printing------------")
        }
    }
    
    func updateTitle(id: Int, name: String, updating: String) {
        func upTi(person: Person, title: String) -> Void {
            print("UT - Updated title of \(person.id) from \(person.title) to \(title)")
            person.title = title
        }
        let transform = upTi
        update(id, name: name, updating: updating, set: transform)
    }
    
    func updateDepartment(id: Int, name: String, updating: String) {
        func upDe(person: Person, department: String) -> Void {
            print("UD - Updated department of \(person.id) from \(person.department) to \(department)")
            person.department = department
        }
        let transform = upDe
        update(id, name: name, updating: updating, set: transform)
    }
    
    func updatePay(id: Int, name: String, updating: String) {
        func upPa(person: Person, pay: String) -> Void {
            print("UP - Updated payment of \(person.id) from \(person.pay) to \(pay)")
            person.pay = Double(pay)!
        }
        let transform = upPa
        update(id, name: name, updating: updating, set: transform)
    }
    
    func update(id: Int, name: String, updating: String, set: (Person, String) -> Void) {
        if isEmpty() {
            print("UPDATE - List is empty.")
        }
        else {
            var runner: Person? = root!.next
            
            while runner != nil && runner!.id == id && runner!.name == name {
                runner = runner!.next
            }
            
            // if we actually find somebody
            if runner != nil {
                set(runner!, updating)
            }
            else {
                print("UPDATE - Cannot update \(id) with name: \(name). Provided id and name does not match anyone in the list.");
            }
        }
    }
    
    func isEmpty() -> Bool {
        return size == 0;
    }
}

