//
//  JuegoController.swift
//  Master mind
//
//  Created by Mac13 on 17/04/23.
//

import UIKit
import AVFAudio
import AVFoundation

class JuegoController: UIViewController {
    
    var audioPlayer: AVAudioPlayer?

    var numeros = [Int]()
    
    var ColorSeleccionado = "No_selecionado"
    var valorColor = 0
    var puntuacion = 5000
    var numerosAla = [Int]()
    
    var Nivel:[UIButton]!
       
    @IBOutlet var btns1: [UIButton]!
    @IBOutlet weak var Bien1: UILabel!
    @IBOutlet weak var Mal1: UILabel!
    
    @IBOutlet var btns2: [UIButton]!
    @IBOutlet weak var Bien2: UILabel!
    @IBOutlet weak var Mal2: UILabel!
    
    
    @IBOutlet var btns3: [UIButton]!
    @IBOutlet weak var Bien3: UILabel!
    @IBOutlet weak var Mal3: UILabel!
    
    @IBOutlet var btns4: [UIButton]!
    @IBOutlet weak var Bien4: UILabel!
    @IBOutlet weak var Mal4: UILabel!
    
    @IBOutlet var btns5: [UIButton]!
    @IBOutlet weak var Bien5: UILabel!
    @IBOutlet weak var Mal5: UILabel!
    
    @IBOutlet var btns6: [UIButton]!
    @IBOutlet weak var bien6: UILabel!
    @IBOutlet weak var Mal6: UILabel!
    
    @IBOutlet var btns7: [UIButton]!
    @IBOutlet weak var Bien7: UILabel!
    @IBOutlet weak var Mal7: UILabel!
    
    @IBOutlet var btns8: [UIButton]!
    @IBOutlet weak var Bien8: UILabel!
    @IBOutlet weak var Mal8: UILabel!
    
    @IBOutlet var btns9: [UIButton]!
    @IBOutlet weak var Bien9: UILabel!
    @IBOutlet weak var Mal9: UILabel!
    
    @IBOutlet var btns10: [UIButton]!
    @IBOutlet weak var Bien10: UILabel!
    @IBOutlet weak var Mal10: UILabel!
    
    @IBOutlet var btnsMeta: [UIButton]!
    
    @IBOutlet weak var btnMeta1: UIButton!
    @IBOutlet weak var btnMeta2: UIButton!
    @IBOutlet weak var btnMeta3: UIButton!
    @IBOutlet weak var btnMeta4: UIButton!
    
    @IBOutlet weak var btnRegresar: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        musicaInicio()
        
        //Do any additional setup after loading the view.
        Nivel = btns1
        numerosAla = generarnumeroColor()
        print("ALA \(numerosAla)")
        print("Numeros meta: ")
        print(numerosAla)
        
        habilitarTablero(false, tablero: btns2)
        habilitarTablero(false, tablero: btns3)
        habilitarTablero(false, tablero: btns4)
        habilitarTablero(false, tablero: btns5)
        habilitarTablero(false, tablero: btns6)
        habilitarTablero(false, tablero: btns7)
        habilitarTablero(false, tablero: btns8)
        habilitarTablero(false, tablero: btns9)
        habilitarTablero(false, tablero: btns10)
        habilitarTablero(false, tablero: btnsMeta)
        
        
    }
    
    
    @IBAction func RegresarView(_ sender: Any) {
        guard let audioPath = Bundle.main.path(forResource: "Burbuja", ofType: "mp3") else { return }
        let audioUrl = URL(fileURLWithPath: audioPath)

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioUrl)
        } catch {
            print("Error al cargar el archivo de audio: \(error.localizedDescription)")
        }
        
        audioPlayer?.play()
        
        dismiss(animated: true, completion: nil)
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
    
    
    func generarnumeroColor()-> [Int]{
        
        while numeros.count < 4 {
            let numero = Int.random(in: 1...8)
            if !numeros.contains(numero) {
                numeros.append(numero)
            }
        }
        
        habilitarTablero(true, tablero: btns1)
        return numeros
    }
    
    @IBAction func btnVerde(_ sender: Any) {
        ColorSeleccionado = "verde"
        valorColor = 1
    }
    
    @IBAction func btnAzul(_ sender: Any) {
        ColorSeleccionado = "azul"
        valorColor = 2
    }
    
    @IBAction func btnMorado(_ sender: Any) {
        ColorSeleccionado = "morado"
        valorColor = 3
    }
    
    @IBAction func btnRojo(_ sender: Any) {
        ColorSeleccionado = "rojo"
        valorColor = 4
    }
    
    @IBAction func btnNaranja(_ sender: Any) {
        ColorSeleccionado = "naranja"
        valorColor = 5
    }
    
    @IBAction func btnAmarillo(_ sender: Any) {
        ColorSeleccionado = "amarillo"
        valorColor = 6
    }
    
    @IBAction func btnblanco(_ sender: Any) {
        ColorSeleccionado = "blanco"
        valorColor = 7
    }
    
    
    @IBAction func btnDorado(_ sender: Any) {
        ColorSeleccionado = "dorado"
        valorColor = 8
    }
    
    func habilitarTablero(_ estado:Bool, tablero:[UIButton])
    {
        for boton in tablero
        {
            boton.isEnabled = estado
        }
    }
    
  
    
    @IBAction func ColocarColor(_ sender: UIButton) {
        
        if ColorSeleccionado == "No_selecionado"
        {
            let alerta = UIAlertController(title: "Alerta!", message: "Seleciona un color c:", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Aceptar", style: .destructive)
            alerta.addAction(ok)
            self.present(alerta, animated: true)
        }
        else{
            sender.setImage(UIImage(named: ColorSeleccionado), for: .normal)
            sender.tag = valorColor 
        }
    }
    
    @IBAction func ChecarNivel(_ sender: UIButton)
    {
        var valorChec = [Int]()
       
        var selectedButtonTag = 0
        
        for button in Nivel {
            if button.tag == button.tag {
                selectedButtonTag = button.tag
                valorChec.append(selectedButtonTag)
            }
            else{
                print("No hay tag revisa")
            }
        }
        print("valores del nivel:")
        print(valorChec)
        
        var Coinciden = 0
        var No_Coinciden = 0
        
        for i in 0..<numerosAla.count
        {
            if numerosAla[i] == valorChec[i]
            {
                Coinciden += 1
                
            }else
            {
                No_Coinciden += 1
            }
        }
        
        if Coinciden == 4{
            sonidoGanar()
            mostrarMeta()
            let alerta = UIAlertController(title: "Felicidades Compadre!!", message: "Ganaste Wow eso si que es impresionante :)", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                    self.dismiss(animated: true, completion: nil)
                }
                alerta.addAction(okAction)
                self.present(alerta, animated: true, completion: nil)
            
        }else{
            MostrarDatosTabla(Coinciden, No_Coinciden)
        }
    }
    
    func MostrarDatosTabla(_ NumeroSiC:Int, _ NumerosNoC:Int){
        print("Numeros meta: ")
        print(numerosAla)
        print("Numeros que coinciden: ")
        print(NumeroSiC)
        print("Numeros que no coinciden: ")
        print(NumerosNoC)
        
        switch Nivel
        {
        case btns1:
            Bien1.text = String(NumeroSiC)
            Mal1.text = String(NumerosNoC)
        case btns2:
            Bien2.text = String(NumeroSiC)
            Mal2.text = String(NumerosNoC)
        case btns3:
            Bien3.text = String(NumeroSiC)
            Mal3.text = String(NumerosNoC)
        case btns4:
            Bien4.text = String(NumeroSiC)
            Mal4.text = String(NumerosNoC)
        case btns5:
            Bien5.text = String(NumeroSiC)
            Mal5.text = String(NumerosNoC)
            
        case btns6:
            bien6.text = String(NumeroSiC)
            Mal6.text = String(NumerosNoC)
        case btns7:
            Bien7.text = String(NumeroSiC)
            Mal7.text = String(NumerosNoC)
        case btns8:
            Bien8.text = String(NumeroSiC)
            Mal8.text = String(NumerosNoC)
        case btns9:
            Bien9.text = String(NumeroSiC)
            Mal9.text = String(NumerosNoC)
        case btns10:
            Bien10.text = String(NumeroSiC)
            Mal10.text = String(NumerosNoC)

            mostrarMeta()
            
            sonidoPerder()
            let alerta = UIAlertController(title: "Perdistee!!!", message: "Nimodo compa suerte para la proxima", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                    self.dismiss(animated: true, completion: nil)
                }
                alerta.addAction(okAction)
                self.present(alerta, animated: true, completion: nil)
            
             
        default:
            print("Hola:C ya me quiero ir a casa")
        }
        
        if NumerosNoC > 0{
            CambiarNivel(Nivel)
        }
    }
    
    func mostrarMeta(){
        
        for n in 0..<numerosAla.count
        {
            if numerosAla[n] == numerosAla[0]{
                
                switch numerosAla[n]
                 {
                case 1:
                    print("1")
                    btnMeta1.setImage(UIImage(named: "verde"), for: .normal)
                case 2:
                    print("2")
                    btnMeta1.setImage(UIImage(named: "azul"), for: .normal)
                case 3:
                    print("3")
                    btnMeta1.setImage(UIImage(named: "morado"), for: .normal)
                case 4:
                    print("4")
                    btnMeta1.setImage(UIImage(named: "rojo"), for: .normal)
                case 5:
                    print("5")
                    btnMeta1.setImage(UIImage(named: "naranja"), for: .normal)
                case 6:
                    print("6")
                    btnMeta1.setImage(UIImage(named: "amarillo"), for: .normal)
                case 7:
                    print("7")
                    btnMeta1.setImage(UIImage(named: "blanco"), for: .normal)
                case 8:
                    print("8")
                    btnMeta1.setImage(UIImage(named: "dorado"), for: .normal)
                    
                default:
                    print("aqui vamos de nuevo")
                }
            }
            else
            {
                if numerosAla[n] == numerosAla[1] {
                    
                switch numerosAla[n]
                     {
                case 1:
                    print("1")
                    btnMeta2.setImage(UIImage(named: "verde"), for: .normal)
                case 2:
                    print("2")
                    btnMeta2.setImage(UIImage(named: "azul"), for: .normal)
                case 3:
                    print("3")
                    btnMeta2.setImage(UIImage(named: "morado"), for: .normal)
                case 4:
                    print("4")
                    btnMeta2.setImage(UIImage(named: "rojo"), for: .normal)
                case 5:
                    print("5")
                    btnMeta2.setImage(UIImage(named: "naranja"), for: .normal)
                case 6:
                    print("6")
                    btnMeta2.setImage(UIImage(named: "amarillo"), for: .normal)
                case 7:
                    print("7")
                    btnMeta2.setImage(UIImage(named: "blanco"), for: .normal)
                case 8:
                    print("8")
                    btnMeta2.setImage(UIImage(named: "dorado"), for: .normal)
                    
                default:
                    print("aqui vamos de nuevo")
                }
                }
                
                if numerosAla[n] == numerosAla[2] {
                    
                    switch numerosAla[n]
                    {
                    case 1:
                        print("1")
                        btnMeta3.setImage(UIImage(named: "verde"), for: .normal)
                    case 2:
                        print("2")
                        btnMeta3.setImage(UIImage(named: "azul"), for: .normal)
                    case 3:
                        print("3")
                        btnMeta3.setImage(UIImage(named: "morado"), for: .normal)
                    case 4:
                        print("4")
                        btnMeta3.setImage(UIImage(named: "rojo"), for: .normal)
                    case 5:
                        print("5")
                        btnMeta3.setImage(UIImage(named: "naranja"), for: .normal)
                    case 6:
                        print("6")
                        btnMeta3.setImage(UIImage(named: "amarillo"), for: .normal)
                    case 7:
                        print("7")
                        btnMeta3.setImage(UIImage(named: "blanco"), for: .normal)
                    case 8:
                        print("8")
                        btnMeta3.setImage(UIImage(named: "dorado"), for: .normal)
                        
                    default:
                        print("aqui vamos de nuevo")
                    }}
                    else
                    {
                        if numerosAla[n] == numerosAla[3] {
                            
                        switch numerosAla[n]
                             {
                        case 1:
                            print("1")
                            btnMeta4.setImage(UIImage(named: "verde"), for: .normal)
                        case 2:
                            print("2")
                            btnMeta4.setImage(UIImage(named: "azul"), for: .normal)
                        case 3:
                            print("3")
                            btnMeta4.setImage(UIImage(named: "morado"), for: .normal)
                        case 4:
                            print("4")
                            btnMeta4.setImage(UIImage(named: "rojo"), for: .normal)
                        case 5:
                            print("5")
                            btnMeta4.setImage(UIImage(named: "naranja"), for: .normal)
                        case 6:
                            print("6")
                            btnMeta4.setImage(UIImage(named: "amarillo"), for: .normal)
                        case 7:
                            print("7")
                            btnMeta4.setImage(UIImage(named: "blanco"), for: .normal)
                        case 8:
                            print("8")
                            btnMeta4.setImage(UIImage(named: "dorado"), for: .normal)
                            
                        default:
                            print("aqui vamos de nuevo")
                        }
                        }
                }
            }
            
        }
    }
    
    func sonidoEquivocado(){
        guard let audioPath = Bundle.main.path(forResource: "Equivocacion", ofType: "mp3") else { return }
        let audioUrl = URL(fileURLWithPath: audioPath)

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioUrl)
        } catch {
            print("Error al cargar el archivo de audio: \(error.localizedDescription)")
        }
        
        audioPlayer?.play()
    }
    
    func sonidoGanar (){
        guard let audioPath = Bundle.main.path(forResource: "Logro", ofType: "mp3") else { return }
        let audioUrl = URL(fileURLWithPath: audioPath)

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioUrl)
        } catch {
            print("Error al cargar el archivo de audio: \(error.localizedDescription)")
        }
        
        audioPlayer?.play()
    }
    
    func sonidoPerder(){
        guard let audioPath = Bundle.main.path(forResource: "GameOver", ofType: "mp3") else { return }
        let audioUrl = URL(fileURLWithPath: audioPath)

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioUrl)
        } catch {
            print("Error al cargar el archivo de audio: \(error.localizedDescription)")
        }
        
        audioPlayer?.play()
    }
 
    
    func CambiarNivel(_ NumeroNivel:[UIButton]){
        switch Nivel
        {
        case btns1:
            habilitarTablero(false, tablero: btns1)
            Nivel = btns2
            habilitarTablero(true, tablero:btns2)
            
        case btns2:
            habilitarTablero(false, tablero: btns2)
            Nivel = btns3
            habilitarTablero(true, tablero:btns3)
        case btns3:
            habilitarTablero(false, tablero: btns3)
            Nivel = btns4
            habilitarTablero(true, tablero:btns4)
        case btns4:
            habilitarTablero(false, tablero: btns4)
            Nivel = btns5
            habilitarTablero(true, tablero:btns5)
        case btns5:
            habilitarTablero(false, tablero: btns5)
            Nivel = btns6
            habilitarTablero(true, tablero:btns6)
            
        case btns6:
            habilitarTablero(false, tablero: btns6)
            Nivel = btns7
            habilitarTablero(true, tablero:btns7)
        case btns7:
            habilitarTablero(false, tablero: btns7)
            Nivel = btns8
            habilitarTablero(true, tablero:btns8)
        case btns8:
            habilitarTablero(false, tablero: btns8)
            Nivel = btns9
            habilitarTablero(true, tablero:btns9)
        case btns9:
            habilitarTablero(false, tablero: btns9)
            Nivel = btns10
            habilitarTablero(true, tablero:btns10)
        case btns10:
            habilitarTablero(false, tablero: btns10)
        default:
            print("Jaja que genial")
        }
    }
    
    
    
    
}
