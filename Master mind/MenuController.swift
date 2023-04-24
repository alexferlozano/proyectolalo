//
//  MenuController.swift
//  Master mind
//
//  Created by Mac13 on 10/04/23.
//

import UIKit
import AVFoundation


class MenuController: UIViewController {
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        musicaInicio()
       
        // Do any additional setup after loading the view.
    }
    

    @IBAction func Inicio(_ sender: Any) {
        audioPlayer?.stop()
        self.performSegue(withIdentifier: "juego", sender: nil)
        
        guard let audioPath = Bundle.main.path(forResource: "Burbuja", ofType: "mp3") else { return }
        let audioUrl = URL(fileURLWithPath: audioPath)

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioUrl)
        } catch {
            print("Error al cargar el archivo de audio: \(error.localizedDescription)")
        }
        
        audioPlayer?.play()
        

    }
    
    @IBAction func Records(_ sender: Any) {
        audioPlayer?.stop()
        self.performSegue(withIdentifier: "records", sender: nil)
        
        guard let audioPath = Bundle.main.path(forResource: "Burbuja", ofType: "mp3") else { return }
        let audioUrl = URL(fileURLWithPath: audioPath)

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioUrl)
        } catch {
            print("Error al cargar el archivo de audio: \(error.localizedDescription)")
        }
        
        audioPlayer?.play()
    }
    
    
    
    func musicaInicio()
    {
        guard let path = Bundle.main.path(forResource: "MusicaFondo", ofType: "mp3") else {
          return
        }

        do {
          audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
        } catch {
          print("Error al cargar el archivo de audio")
        }
        
        audioPlayer?.numberOfLoops = -1
        audioPlayer?.prepareToPlay()
        audioPlayer?.play()
    }
    

}
