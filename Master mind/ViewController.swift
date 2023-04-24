//
//  ViewController.swift
//  Master mind
//
//  Created by Mac13 on 10/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgSplash: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgSplash.frame = CGRect(x: (view.frame.width - imgSplash.frame.width)/2.0, y:imgSplash.frame.height, width: imgSplash.frame.width, height: imgSplash.frame.height)
        imgSplash.alpha = 0.0
        
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        UIView.animate(withDuration: 2.5) {
            self.imgSplash.frame.origin.y = (self.view.frame.height - self.imgSplash.frame.height)/2.0
            self.imgSplash.alpha = 1.0
        } completion: { res in
            self.performSegue(withIdentifier: "sgSplash", sender: nil)
            
           
        }
        
    }
    
    


}

