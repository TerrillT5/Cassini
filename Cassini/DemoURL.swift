//
//  URL.swift
//
//  Created by CS193p Instructor.
//  Copyright (c) 2016 Stanford University. All rights reserved.
//

import Foundation

struct DemoURL
{
    static let stanford = "http://comm.stanford.edu/wp-content/uploads/2013/01/stanford-campus.png"

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

