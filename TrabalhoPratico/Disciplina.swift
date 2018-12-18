//
//  Disciplina.swift
//  TrabalhoPratico
//
//  Created by Bruno Ferreira on 11/12/2018.
//  Copyright © 2018 Bruno Ferreira. All rights reserved.
//

import Foundation
class Disciplina:NSObject,NSCoding{
    var nome:String
    var ano:String
    var semestre:String
    var dataNormal:Date
    var dataRecurso:Date
    var dataEspecial:Date
    
    init(nome:String,ano:String,semestre:String,datanormal:Date,datarecurso:Date,dataespecial:Date){
        self.nome = nome
        self.ano = ano
        self.semestre = semestre
        self.dataNormal = datanormal
        self.dataRecurso = datarecurso
        self.dataEspecial = dataespecial
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let nome = aDecoder.decodeObject(forKey: "nome") as? String else {
            return nil
        }
        guard let ano = aDecoder.decodeObject(forKey: "ano") as? String else {
            return nil
        }
        guard let semestre = aDecoder.decodeObject(forKey: "semestre") as? String else {
            return nil
        }
        guard let dataNormal = aDecoder.decodeObject(forKey: "dataNormal") as? Date else {
            return nil
        }
        guard let dataRecurso = aDecoder.decodeObject(forKey: "dataRecurso") as? Date else {
            return nil
        }
        guard let dataEspecial = aDecoder.decodeObject(forKey: "dataEspecial") as? Date else {
            return nil
        }
        
        self.nome = nome
        self.ano = ano
        self.semestre = semestre
        self.dataNormal = dataNormal
        self.dataRecurso = dataRecurso
        self.dataEspecial = dataEspecial
        
    }
    
    override var description:String{
        return "\(nome) [\(ano)] [\(semestre)] [\(dataNormal)] [\(dataRecurso)] [\(dataEspecial)]"
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nome, forKey: "nome")
        aCoder.encode(ano, forKey: "ano")
        aCoder.encode(semestre,forKey: "semestre")
        aCoder.encode(dataNormal, forKey: "dataNormal")
        aCoder.encode(dataRecurso, forKey: "dataRecurso")
        aCoder.encode(dataEspecial, forKey: "dataEspecial")
    }
}
