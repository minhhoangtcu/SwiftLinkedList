import Foundation

// IMPORTANT VARIABLES/CONSTRANT
let filePath : String = "./Lab5Data.txt"


// START OF PROGRAM
print("<<< PROGRAM INITIALIZED >>>")

if let aStreamReader = StreamReader(path: filePath) {
    
    defer {
        aStreamReader.close()
    }
    
    print("<<< SUCCESSFUL READ FROM \(filePath) >>>")
    while let line = aStreamReader.nextLine() {
        
        let allInfo = line.componentsSeparatedByString(" ")
        
        let command = allInfo[0]
        
        print(command)
        
    }
}


