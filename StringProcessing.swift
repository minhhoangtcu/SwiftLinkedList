//
//  StringProcessing.swift
//  Lab5
//
//  Created by Hoang, Minh on 4/6/16.
//  Copyright © 2016 Hoang, Minh. All rights reserved.
//

import Foundation

// Remove two last characters
func removeTwoEndingChars(text: String) -> String {
    var output: String = text
    output.removeAtIndex(output.endIndex.predecessor())
    output.removeAtIndex(output.endIndex.predecessor())
    return output
}
