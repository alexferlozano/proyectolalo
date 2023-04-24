//
//  File.swift
//  Master mind
//
//  Created by Solidusystems on 24/04/23.
//

import Foundation


class fileUpdater {
    let fileManager = FileManager.default
    var filePath = "score.json"
    var datos: [Person] = [
        Person(name: "Juan", score: 500),
        Person(name: "Juan2", score: 600),
        Person(name: "Juan3", score: 700),
        Person(name: "Juan4", score: 800),
        Person(name: "Juan5", score: 900),
    ]
    
    init (){
        let documentsDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
        let filePath = documentsDirectory.appendingPathComponent("people.json")
        self.filePath = filePath
        
        if fileManager.fileExists(atPath: filePath) {
            var nuevosDatos = readScores(/*filePath: filePath*/)
            datos = nuevosDatos == [] ? datos : nuevosDatos
//            print("Datos \(datos)")
        } else {
            writeFile(scores: datos)
        }
    }
    
    func updateFile(scores: [Person]){
        if fileManager.fileExists(atPath: self.filePath) {
            writeFile(scores: scores)
        } else {
            
        }
    }
    
    func readScores(/*filePath: String*/) -> [Person]{
        var people: [Person] = []
        do {
            let fileData = try Data(contentsOf: URL(fileURLWithPath: self.filePath))
            let decoder = JSONDecoder()
            let json = try? decoder.decode([Person].self, from: fileData)
            if let json = json {
                people = json
//                print("JSON \(people)")
                return people
            }
            return people
        } catch {
            print("Error al leer el archivo: \(error.localizedDescription)")
        }
        return people
    }
    
    private func writeFile(scores: [Person]){
        let encoder = JSONEncoder()
        if let jsonData = try? encoder.encode(scores) {
            do {
                let documentsDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
                let filePath = documentsDirectory.appendingPathComponent("people.json")

                try jsonData.write(to: URL(fileURLWithPath: filePath))
                print("Archivo JSON guardado correctamente en: \(filePath)")
            } catch {
                print("Error al escribir el archivo JSON: \(error)")
            }
        }
    }
}

struct Person: Codable, Equatable {
    var name: String
    var score: Int
    
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
}
