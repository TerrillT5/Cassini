//
//  URL.swift
//
//  Created by CS193p Instructor.
//  Copyright (c) 2016 Stanford University. All rights reserved.
//

import Foundation

struct DemoURL
{
//     static let stanford = URL(string: "http://comm.stanford.edu/wp-content/uploads/2013/01/stanford-campus.png")
    static let stanford = URL(string: "http://stanford.edu/about/images/intro_about.jpg") // iOS won't load an http up by default
    // go to info.plist 
    // right click then "add row"
    // type in "App transport Security settings then "+"
    // type in "allow Arbitrary loads" & change to YES with a boolean type
        

    static var NASA: Dictionary<String,URL> = {
    let NASAURLStrings = [
        "Cassini" : "http://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg",
        "Earth" : "http://www.nasa.gov/sites/default/files/wave_earth_mosaic_3.jpg",
        "Saturn" : "http://www.nasa.gov/sites/default/files/saturn_collage.jpg"
    ]
    var urls = Dictionary<String,URL>()
        for (key, value) in NASAURLStrings {
            urls[key] = URL(string: value)
        }
        return urls
//    static func NASAImageNamed(imageName: String?) -> NSURL? {
//        if let urlstring = NASA[imageName ?? ""] {
//            return NSURL(string: urlstring)
//        } else {
//            return nil
        }()
    }

