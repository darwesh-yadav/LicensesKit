//
//  License.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 9/29/14.
//  Copyright (c) 2014 Matthew Wyskiel. All rights reserved.
//

import UIKit
/**
*  Describes a library's license
*/
@objc public class License: NSObject, Hashable {
    
    /// The name of the license
    public var name: String {
        get {
            return "Apache Software License 2.0"
        }
    }
    
    /// The license summary text
    public var summaryText: String {
        get {
            return LicenseContentFetcher.getContent(filename: "asl_20_summary")
        }
    }
    
    /// The license full text
    public var fullText: String {
        get {
            return LicenseContentFetcher.getContent(filename: "asl_20_full")
        }
    }
    
    /// The license version
    public var version: String {
        get {
            return "2.0"
        }
    }
    
    /// The license URL
    public var url: String {
        get {
            return "http://www.apache.org/licenses/LICENSE-2.0.txt"
        }
    }
   
}

extension License: Hashable {
    // Hashable
    public override var hashValue: Int {
        get {
            return name.hashValue
        }
    }
}

// Equatable
public func ==(lhs: License, rhs: License) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

@objc public class LicenseContentFetcher {
    private class var bundle: NSBundle {
        return NSBundle(forClass: Notice.self)
    }
    public class func getContent(#filename: String, inBundle bundle: NSBundle = bundle) -> String! {
        if let path = bundle.pathForResource(filename, ofType: "txt") {
            var errorMaybe: NSError?
            let string = NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding, error: &errorMaybe)
            if let error = errorMaybe {
                return nil
            } else {
                return string;
            }
        } else {
            return nil
        }
    }
}
