//
//  CassiniViewController.swift
//  Cassini
//
//  Created by Terrill Thorne on 5/16/17.
//  Copyright © 2017 Terrill Thorne. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController {
    
    override func awakeFromNib() {
         super.awakeFromNib() // makes the view start at this view instead of the blank screen 
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let url = DemoURL.NASA[segue.identifier ?? ""] {
            if let imageVC = (segue.destination.contents as? ImageViewController) // ViewController that we are segueing to
            {
                imageVC.imageURL = url // prepare the image URL
                imageVC.title = (sender as? UIButton)?.currentTitle // sets the title on the navigation controller. Its optional because it may not be true 
            }
        }
    
    }
// End of the class
}

extension UIViewController //extensions have no storage
{
    
    var contents: UIViewController { // contents are what the VC holds 
        if let navcon = self as? UINavigationController { //
            return navcon.visibleViewController ?? self // VC is optional because the VC might not have a VC at the moment
        } else {
            return self // return self if not a navigation controller
        }
        
    }
}
