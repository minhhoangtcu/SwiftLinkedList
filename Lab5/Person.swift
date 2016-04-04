import Foundation

class Person : Comparable {
    
    let id: Int
    let name: String
    var department, title: String
    var pay: Double
    var next: Person?;
    
    init(id: Int, name: String, department: String, title: String, pay: Double) {
        self.id = id
        self.name = name
        self.department = department
        self.title = title
        self.pay = pay
    }  
}

func < (lhs: Person, rhs: Person) -> Bool {
    return lhs.id < rhs.id
}

func == (lhs: Person, rhs: Person) -> Bool {
    return lhs.id == rhs.id
}

