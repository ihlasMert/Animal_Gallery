//
//  ViewController.swift
//  Gallery
//
//  Created by ihlas on 29.12.2021.
//

import UIKit

class ViewController: UIViewController {
    let gallery = [#imageLiteral(resourceName: "Bobcat.jpeg"), #imageLiteral(resourceName: "Cheetah.jpeg"), #imageLiteral(resourceName: "Dolphın.jpeg"), #imageLiteral(resourceName: "Fish.jpeg"), #imageLiteral(resourceName: "Lıon.jpeg"), #imageLiteral(resourceName: "Puffin.jpeg"), #imageLiteral(resourceName: "Robın.jpeg"), #imageLiteral(resourceName: "Turtle.jpeg") ]
    
    @IBOutlet var trashImageView: UIImageView!
    
    var nextIndex = 0
    var currentPictures: UIImageView?
    let originalSize: CGFloat = 300
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func createPicture() -> UIImageView? {
        
        guard nextIndex < gallery.count else { return nil }
        
        let imageView = UIImageView(image: gallery[nextIndex ])
     nextIndex += 1
        return imageView
    }
}

