//
//  RecordsController.swift
//  Master mind
//
//  Created by Mac13 on 17/04/23.
//

import UIKit

class RecordsController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var BtnBack: UIButton!
    var personas: [Person] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        var fileUpdater = fileUpdater()
        personas = fileUpdater.readScores()
        tableView.delegate = self
        tableView.dataSource = self
        //fileUpdater.updateFile()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touch(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personas.count
       }

   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
       let persona = personas[indexPath.row]
       cell.labelNombre.text = persona.name
       cell.labelScore.text = "\(persona.score)"
       return cell
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

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 3
       }

       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "MyCellIdentifier", for: indexPath) as! CustomTableViewCell
//           let persona = personas[indexPath.row]
           cell.labelNombre.text = "nombre"
           cell.labelScore.text = "edad"
           return cell
       }
}
