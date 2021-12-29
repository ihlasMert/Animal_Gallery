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
    var isActive =  false
    var activeSize: CGFloat{
       return originalSize + 10
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

showNextPicture()
        
    }
    func showNextPicture(){
        if  let newPicture = createPicture(){
            currentPictures = newPicture
            showPicture(imageView: newPicture)
        
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.hundleTap))
            newPicture.addGestureRecognizer(tap)
            
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(self.hundleSwipe))
            swipe.direction = .right
            newPicture.addGestureRecognizer(swipe)
            
            
    }else{
        nextIndex = 0
        showNextPicture()
        
    }
    }
    
        @objc func hundleSwipe( sender: UISwipeGestureRecognizer){
            guard !isActive else {return}
            hidePicture(imageView: currentPictures!)
            showNextPicture()
        
}
    @objc func hundleTap(){
        isActive = !isActive
        if isActive{
            activateCurrentPicture()
        }else{
            deactivateCurrentPickture()
        }
        
    }
    
    func activateCurrentPicture(){
        UIView.animate(withDuration: 0.3){
            self.currentPictures?.frame.size = CGSize(width: self.activeSize , height: self.activeSize)
            self.currentPictures?.layer.shadowOpacity = 0.5
            self.currentPictures?.layer.borderColor = UIColor.green.cgColor
            self.currentPictures?.layer.borderColor = UIColor.green.cgColor
            
        }
        
    }
    func deactivateCurrentPickture(){
        UIView.animate(withDuration: 0.3){
            self.currentPictures?.frame.size = CGSize(width: self.originalSize, height: self.originalSize)
            self.currentPictures?.layer.shadowOpacity = 0
            self.currentPictures?.layer.borderColor = UIColor.darkGray.cgColor
            
        }
        
        
    }

   
    func createPicture() -> UIImageView? {
        
        guard nextIndex < gallery.count else { return nil }
        
        let imageView = UIImageView(image: gallery[nextIndex ])
        
        imageView.frame = CGRect(x: self.view.frame.width , y: self.view.center.y - (originalSize / 2), width: originalSize, height: originalSize)
        
        imageView.isUserInteractionEnabled = true
        
        
        //Shadow
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 0
        imageView.layer.shadowOffset = .zero
        imageView.layer.shadowRadius = 10
        
        //Frame
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.darkGray.cgColor
        
     nextIndex += 1
        return imageView
    }
    func showPicture( imageView: UIImageView){
        self.view.addSubview( imageView)
        UIView.animate(withDuration: 0.4){
            imageView.center = self.view.center
        }
        
    }
    
    func hidePicture( imageView: UIImageView){
        
        UIView.animate(withDuration: 0.4, animations: {
       
                self.currentPictures?.frame.origin.y = -self.originalSize
        }) {_ in ();  
   
                imageView.removeFromSuperview()
        }
    }
    
}



