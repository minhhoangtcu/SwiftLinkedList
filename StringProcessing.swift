//
//  StringProcessing.swift
//  Lab5
//
//  Created by Hoang, Minh on 4/6/16.
//  Copyright © 2016 Hoang, Minh. All rights reserved.
//

import Foundation

// Get pay from String. Remove two last characters: \r
func getPay(text: String) -> Double {
    let range = text.endIndex.advancedBy(-2)..<text.endIndex
    var output = text
    output.removeRange(range)
    return Double(output)!
}
