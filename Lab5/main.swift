import Foundation

// IMPORTANT VARIABLES/CONSTRANT
let filePath : String = "./en.lproj/Lab5Data.txt"


// START OF PROGRAM
print("<<< PROGRAM INITIALIZED >>>")

if let aStreamReader = StreamReader(path: filePath) {
    
    defer {
        aStreamReader.close()
    }
    
    print("<<< SUCCESSFUL READ FROM \(filePath) >>>")
    
    let list: PeopleList = PeopleList()
    
    while let line = aStreamReader.nextLine() {
        
        var allInfo = line.componentsSeparatedByString(" ")
        allInfo = allInfo.filter { $0 != "" }
        
        let command = allInfo[0]
        
        switch command {
            
            case "IN":
                let id: Int = Int(allInfo[1])!
                let name: String = allInfo[2]
                let department: String = allInfo[3]
                let title: String = allInfo[4]
                let pay: Double = getPay(allInfo[5])
                list.add(Person(id: id, name: name, department: department, title: title, pay: pay))
            
//            case "DE":
//            
//            case "UD":
//            
//            case "UT":
//            
//            case "UP":
//            
//            case "PA"
//            
//            case "PI"
//            
//            case "PT"
//            
//            case "PD""
        default:
            print()
        }
    }
}

// TERMINATE PROGRAM
print("<<< PROGRAM TERMINATED >>>")