/* Program Name:    Lab 5                                                 *
*                                                                         *
*  Student Name:    Han Ngo, Minh Hoang                                   *
*  Semester:        Spring,  2016                                         *
*  Class & Section: CoSc 30403                                            *
*  Instructor:      Dr. James Comer                                       *
*  Due Date:        September 23, 1999                                    *
*                                                                         *
*   Program Overview:                                                     *
*       This program employs Snobol4, uses derived type to build the data *
*       structure of a linked list. There are four main functions for the *
*       project - insertion, update, deletion, and display. Information is*
*       inserted in order, so searching and display will be also in order *
*       The program reads the input file and do accordantly through       *
*       subroutines and derived type.                                     *
*                                                                         *
*                                                                         *
*   Input: File input provided from the instructor                        *
*                                                                         *
*   Output:                                                               *
*       Output from the program will consist of –                         *
*     1) appropriate user feedback indicating successful completion of    *
*     the commands (insert, delete, update, or print)                     *
*     2) upon termination of the input, a complete listing                *
*     of all nodes in the linked list starting with the first node        *
*                                                                         *
*                                                                         *
*   Significant Program Variables:                                        *
*       id                  - integer type, holds identification number   *
*                           of the person in the list                     *
*       department          - character type, holds the departmental/     *
*                             subject info of the educator                *
*       title               - character type, holds the title             *
*       pay                 - float type, holds the amount of payment     *
*       person              - derived type/object holds all the info      *
*                           and a link to the next person                 *
*       runner              - a pointer of the derived type, used for     *
*                           searching and getting information             *
***************************************************************************/

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