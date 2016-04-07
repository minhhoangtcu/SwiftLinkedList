import Foundation

// IMPORTANT VARIABLES/CONSTRANT
let filePath : String = "./en.lproj/Lab5Data.txt"


// START OF PROGRAM
print("<<< PROGRAM INITIALIZED >>>\n")

if let aStreamReader = StreamReader(path: filePath) {
    
    defer {
        aStreamReader.close()
    }
    
    print("<<< SUCCESSFUL READ FROM \(filePath) >>>\n")
    
    let list: PeopleList = PeopleList()
    
    while let line = aStreamReader.nextLine() {
        
        var allInfo = removeEndingChar(line).componentsSeparatedByString(" ")
        allInfo = allInfo.filter { $0 != "" }
        
        let command = allInfo[0]
        
        switch command {
            
            case "IN":
                let id: Int = Int(allInfo[1])!
                let name: String = allInfo[2]
                let department: String = allInfo[3]
                let title: String = allInfo[4]
                let pay: Double = Double(allInfo[5])!
                list.add(Person(id: id, name: name, department: department, title: title, pay: pay))
            
            case "DE":
                list.remove(Int(allInfo[1])!)
            
            case "UD":
                list.updateDepartment(Int(allInfo[1])!, name: allInfo[2], updating: allInfo[3])

            case "UT":
                list.updateTitle(Int(allInfo[1])!, name: allInfo[2], updating: allInfo[3])
            
            case "UP":
                list.updatePay(Int(allInfo[1])!, name: allInfo[2], updating: allInfo[3])

            case "PA":
                list.printAll()

            case "PI":
                list.printInfo(Int(allInfo[1])!, name: allInfo[2])
            
            case "PT":
                list.printTitle(allInfo[1])

            case "PD":
                list.printDepartment(allInfo[1])
            
        default:
            print()
        }
    }
}

// TERMINATE PROGRAM
print("\n<<< PROGRAM TERMINATED >>>")