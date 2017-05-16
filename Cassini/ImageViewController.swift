//
//  ImageViewController.swift
//  Cassini
//
//  Created by Terrill Thorne on 5/15/17.
//  Copyright © 2017 Terrill Thorne. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    var imageURL: URL? {// this is the model that shows the image
        didSet {
            image = nil // clears out the current image
            if view.window != nil { // if view is on screen
            fetchImage() // then the image will be fetched
        }
     }
    
    }
    private func fetchImage() // created because the internet of the user may be slow when loading the imageURL
    {
        if let url = imageURL {
            let urlContents = try? Data(contentsOf: url) // if you can't get image then you can try
            if let imageData = urlContents {
                image = UIImage(data: imageData) // image from the internet using cellular data
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageURL = DemoURL.stanford  // sets imageURL
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil { // the view will appear
        fetchImage()
     }
    }
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet {
            scrollView.contentSize = imageView.frame.size // encloses the whole image to the view
            scrollView.addSubview(imageView) // adds the image to scroll view
            scrollView?.contentSize = imageView.frame.size
        }
    }
    
    private var imageView = UIImageView() // created the image view in upper left corner
    
    private var image: UIImage? {
        
        get {
            return imageView.image // returns the image of the imageView
        }
        set {
            imageView.image = newValue // sets the image that the "UIImageView" is showing
            imageView.sizeToFit() // causes the image frame to be set to fit the screen
            
        }
    }
}
