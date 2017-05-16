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
            
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.03
            scrollView.maximumZoomScale = 1.0
            scrollView.contentSize = imageView.frame.size // encloses the whole image to the view
            scrollView.addSubview(imageView) // adds the image to scroll view
        }
    }
    
     fileprivate var imageView = UIImageView() // created the image view in upper left corner
     // "fileprivate" allows me to return a imageView in the "viewForZooming" func
     // everyone will not be able to see the ImageView
    
    private var image: UIImage? {
        
        get {
            return imageView.image // returns the image of the imageView
        }
        set {
            imageView.image = newValue // sets the image that the "UIImageView" is showing
            imageView.sizeToFit() // causes the image frame to be set to fit the screen
            scrollView?.contentSize = imageView.frame.size // allows the image to scroll with it being an optional
        }
    }
}

extension ImageViewController : UIScrollViewDelegate {
    // added extension to allow the imageViewController to conform to the ScrollView 
    // "UIScrollViewDelegate can be called at the bottom instead of beside "UIViewController" at the top
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    
}
