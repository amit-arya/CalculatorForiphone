//
//  ViewController.swift
//  Calculator
//
//  Created by AmitArya on 9/2/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculatorWorkings: UILabel!
    @IBOutlet weak var calculatorResults: UILabel!
    
    var workings: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func clearAll(){
        workings = ""
        calculatorWorkings.text = ""
        calculatorResults.text = ""
    }

    @IBAction func equalsTap(_ sender: UIButton) {
        
        if(validIntput()){
            workings = workings.replacingOccurrences(of: "/", with: "*1.0/")
            let checkWrokingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkWrokingsForPercent)
            let results = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: results)
            calculatorResults.text = resultString
        } else{
            let alert = UIAlertController(
             title: "Invalid Input",
             message: "Calculator unable to do the maths",
             preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true)
        }

    }
    
    func validIntput()->Bool{
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in workings{
            if(specialCharacter(char: char)){
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous:Int = -1
        
        for index in funcCharIndexes {
            if(index == 0){
                return false
            }
            if(index == workings.count-1){
                return false
            }
            if(previous != -1){
                if(index - previous == 1){
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    func specialCharacter(char: Character)-> Bool{
        if(char == "*"){
            return true
        }
        if(char == "/"){
            return true
        }
        if(char == "+"){
            return true
        }
        if(char == "-"){
            return true
        }
        if(char == "%"){
            return true
        }
        return false
    }
    
    func formatResult(result: Double)-> String{
        if (result.truncatingRemainder(dividingBy: 1) == 0){
            return String(format: "%.0f", result)
        } else{
            return String(format: "%.3f", result)
        }
    }
    
    @IBAction func allClearTap(_ sender: UIButton) {
        clearAll()
    }
    
    func addToWorkings(value: String){
        workings = workings + value
        calculatorWorkings.text = workings
    }
    
    @IBAction func backTap(_ sender: UIButton) {
        if(!workings.isEmpty){
            workings.removeLast()
            calculatorWorkings.text = workings
        }
    }
    
    
    @IBAction func percentTap(_ sender: UIButton) {
        addToWorkings(value: "%")
    }
    
    
    @IBAction func devideTap(_ sender: UIButton) {
        addToWorkings(value: "/")
    }
    
    
    @IBAction func multiplyTap(_ sender: UIButton) {
        addToWorkings(value: "*")
    }
    
    
    @IBAction func minusTap(_ sender: UIButton) {
        addToWorkings(value: "-")
    }
    
   
    @IBAction func plusTap(_ sender: UIButton) {
        addToWorkings(value: "+")
    }
    
    
    @IBAction func decimalPoint(_ sender: UIButton) {
        addToWorkings(value: ".")
    }
    
    @IBAction func zeroTap(_ sender: UIButton) {
        addToWorkings(value: "0")
    }
    
    
    @IBAction func oneTap(_ sender: UIButton) {
        addToWorkings(value: "1")
    }
    
    
    @IBAction func twoTap(_ sender: UIButton) {
        addToWorkings(value: "2")
    }
    
    
    @IBAction func threeTap(_ sender: UIButton) {
        addToWorkings(value: "3")
    }
    
    
    @IBAction func fourTap(_ sender: UIButton) {
        addToWorkings(value: "4")
    }
    
    
    @IBAction func fiveTap(_ sender: UIButton) {
        addToWorkings(value: "5")
    }
    
    
    @IBAction func sixTap(_ sender: UIButton) {
        addToWorkings(value: "6")
    }
    
    
    @IBAction func sevenTap(_ sender: UIButton) {
        addToWorkings(value: "7")
    }
    
    
    @IBAction func eightTap(_ sender: UIButton) {
        addToWorkings(value: "8")
    }
    
    
    @IBAction func nineTap(_ sender: UIButton) {
        addToWorkings(value: "9")
    }
    
    
    
}

