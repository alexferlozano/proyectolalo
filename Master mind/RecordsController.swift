//
//  RecordsController.swift
//  Master mind
//
//  Created by Mac13 on 17/04/23.
//

import UIKit

class RecordsController: UIViewController {

    @IBOutlet weak var BtnBack: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        var fileUpdater = fileUpdater()
        //fileUpdater.updateFile()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touch(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
