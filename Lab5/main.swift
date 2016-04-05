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
        
        switch command {
            
            case "IN":
            
            case "DE":
            
            case "UD":
            
            case "UT":
            
            case "UP":
            
            case "PA"
            
            case "PI"
            
            case "PT"
            
            case "PD""
            
        }
        
        print(command)
        
    }
}

// TERMINATE PROGRAM
print("<<< PROGRAM TERMINATED >>>")