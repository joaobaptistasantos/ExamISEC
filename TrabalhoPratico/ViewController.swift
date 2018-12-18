//
//  ViewController.swift
//  TrabalhoPratico
//
//  Created by Bruno Ferreira on 11/12/2018.
//  Copyright © 2018 Bruno Ferreira. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    
    
    let semestre = ["1","2"]
    let ano = ["1","2","3"]
   
    @IBOutlet weak var SemestrePV: UIPickerView!
    @IBOutlet weak var AnoPV: UIPickerView!
    @IBOutlet weak var NormalPV: UIDatePicker!
    @IBOutlet weak var RecursoPV: UIDatePicker!
    @IBOutlet weak var EspecialPV: UIDatePicker!
    @IBOutlet weak var tfName: UITextField!
    
    var SemestreSelecionado:String=""
    var AnoSelecionado:String=""
    var Normal:Date?
    var Recurso:Date?
    var Especial:Date?
    var AnoRowSelected:Int=0
    var SemestreRowSelected:Int=0
    
    
    var delegate : RefreshTableView?
    var selectedDisciplina : Disciplina?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView === AnoPV){
            return ano.count
        }
        if(pickerView === SemestrePV){
            return semestre.count
        }
        return 0
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView === AnoPV){
            return ano[row]
        }
        if(pickerView === SemestrePV){
            return semestre[row]
        }
        return " "
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView === AnoPV){
            AnoSelecionado = ano[row]
            AnoRowSelected = row
            //return AnoSelecionado
        }
        if(pickerView === SemestrePV){
            SemestreSelecionado = semestre[row]
            SemestreRowSelected = row
            //return SemestreSelecionado
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //if let disciplina = selectedDisciplina{
            //tfName.text = disciplina.nome
            //SemestrePV.selectRow(2, inComponent: 0, animated: true)
            
            //SemestrePV.selectRow(<#T##row: Int##Int#>, inComponent: <#T##Int#>, animated: <#T##Bool#>)
            
            //SemestrePV.selectRow(<#T##row: Int##Int#>, inComponent: <#T##Int#>, animated: <#T##Bool#>)
            
            
        //}
       // tfName.becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidLayoutSubviews() {
        if let disciplina = selectedDisciplina{
            tfName.text = disciplina.nome
            SemestrePV.selectRow(semestre.index(of: disciplina.semestre)!, inComponent: 0, animated: true)
            AnoPV.selectRow(ano.index(of: disciplina.ano)!, inComponent: 0, animated: true)
            NormalPV.date = disciplina.dataNormal
            RecursoPV.date = disciplina.dataRecurso
            EspecialPV.date = disciplina.dataEspecial
        }
        tfName.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onSave(_ sender: Any) {
        guard let name = tfName.text, name.count > 0 else{
            tfName.becomeFirstResponder()
            return
        }
        Normal = NormalPV.date
        Recurso = RecursoPV.date
        Especial = EspecialPV.date
        
        /*if let contacto = selectedContact{
            contacto.nome = name
            contacto.email = email
        }else{*/
        let disciplina = Disciplina(nome:name,ano:AnoSelecionado,semestre:SemestreSelecionado,datanormal:Normal!,datarecurso:Recurso!,dataespecial:Especial!)
        let app = UIApplication.shared.delegate as! AppDelegate
        app.lstDisciplinas.append(disciplina)
        
        delegate?.refresh()
        print("ILA")
        navigationController?.popViewController(animated: true)
    }
}

