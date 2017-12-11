//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Michael  Douglas on 11/10/17.
//  Copyright © 2017 Michael Douglas. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    var inputNum:Double = 0
    var outputNum: Double = 0
    var nums: String = ""
    @IBOutlet weak var inputDisplay: UITextField!
    @IBOutlet weak var outputDisplay: UITextField!
    
    
    var converters: [Converter] = [Converter]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        converters = [
            Converter(label: "Fahrenheit to Celcius", inUnit: "°F", outUnit: "°C"),
            Converter(label: "Celcius to Fahrenheit", inUnit: "°C", outUnit: "°F"),
            Converter(label: "Miles to Kilometers", inUnit: "mi", outUnit: "km"),
            Converter(label: "Kilometers to Miles", inUnit: "km", outUnit: "mi")
        ]
        inputDisplay.textAlignment = NSTextAlignment.right
        outputDisplay.textAlignment = NSTextAlignment.right
         inputDisplay.text = converters[0].inUnit
        outputDisplay.text = converters[0].outUnit
    
    
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func converterButton(_ sender: UIButton) {
        let event = UIAlertController( title: "Choose Converter", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        for converter in converters
        {
            event.addAction(UIAlertAction( title: converter.label, style: UIAlertActionStyle.default, handler: {
                (alertAction) -> Void in
                self.outputDisplay.text = converter.outUnit
                self.inputDisplay.text = converter.inUnit
                self.inputDisplay.textAlignment = NSTextAlignment.right
                self.outputDisplay.textAlignment = NSTextAlignment.right
            }))
        }
        
        event.addAction(UIAlertAction( title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(event, animated: true, completion: nil)
    }
    
    @IBAction func numbers(_ sender: UIButton)
    {

        if (outputDisplay.text!.contains("°C")) {
            
            nums = nums + String(sender.tag-1)
            inputDisplay.text = nums + " °F"
            inputNum = Double(nums)!
            outputNum = fahToCel(inputNum: inputNum)
            outputDisplay.text = String(outputNum) + " °C"
        }
         else if outputDisplay.text!.contains("°F")
        {
            nums = nums + String(sender.tag-1)
            inputDisplay.text = nums + " °C"
            inputNum = Double(nums)!
            outputNum = celToFah(inputNum: inputNum)
            outputDisplay.text = String(outputNum) + " °F"
            
        } else if outputDisplay.text!.contains("km")
        {
            nums = nums + String(sender.tag-1)
            inputDisplay.text = nums + " mi"
            inputNum = Double(nums)!
            outputNum = miToKm(inputNum: inputNum)
            outputDisplay.text = String(outputNum) + " km"
        } else if outputDisplay.text!.contains("mi")
        {
            nums = nums + String(sender.tag-1)
            inputDisplay.text = nums + " km"
            inputNum = Double(nums)!
            outputNum = kmToMi(inputNum: inputNum)
            outputDisplay.text = String(outputNum) + " mi"
        }
        

      
    }
    
    @IBAction func buttons(_ sender: UIButton)
    {
        if sender.tag != 11
        {
            if sender.tag == 12 { // neg/pos
                if inputNum == 0 {
                    return
                }
                if outputDisplay.text!.contains("°C") {
                    inputNum = inputNum * -1
                inputDisplay.text = String(inputNum) + " °F"
                outputNum = fahToCel(inputNum: inputNum)
                outputDisplay.text = String(outputNum) + " °C"
                } else if outputDisplay.text!.contains("°F") {
                    inputNum = inputNum * -1
                    inputDisplay.text = String(inputNum) + " °C"
                    outputNum = celToFah(inputNum: inputNum)
                    outputDisplay.text = String(outputNum) + " °F"
                } else if outputDisplay.text!.contains("km") {
                    inputNum = inputNum * -1
                    inputDisplay.text = String(inputNum) + " mi"
                    outputNum = miToKm(inputNum: inputNum)
                    outputDisplay.text = String(outputNum) + " km"
                    
                } else if outputDisplay.text!.contains("mi") {
                    inputNum = inputNum * -1
                    inputDisplay.text = String(inputNum) + " km"
                    outputNum = kmToMi(inputNum: inputNum)
                    outputDisplay.text = String(outputNum) + " mi"
                }
            }
            else if sender.tag == 13 // .
            {   if inputDisplay.text!.contains(".") {
                return
                }
                if outputDisplay.text!.contains("°C") {
                nums = nums + "."
                inputNum = Double(Double(nums)!)
                inputDisplay.text = String(inputNum) + " °F"
                    
                } else if outputDisplay.text!.contains("°F") {
                    nums = nums + "."
                    inputNum = Double(Double(nums)!)
                    inputDisplay.text = String(inputNum) + " °C"
                } else if outputDisplay.text!.contains("km") {
                    nums = nums + "."
                    inputNum = Double(Double(nums)!)
                    inputDisplay.text = String(inputNum) + " mi"
                } else if outputDisplay.text!.contains("mi") {
                    nums = nums + "."
                    inputNum = Double(Double(nums)!)
                    inputDisplay.text = String(inputNum) + " km"
                }
            }
        } else if sender.tag == 11 {  //Clear
            inputNum = 0
            outputNum = 0
            nums = ""
            if outputDisplay.text!.contains("°C") {
                inputDisplay.text = "°F"
                outputDisplay.text = "°C"
            } else if outputDisplay.text!.contains("°F") {
                inputDisplay.text = "°C"
                outputDisplay.text = "°F"
            } else if outputDisplay.text!.contains("km") {
                inputDisplay.text = "mi"
                outputDisplay.text = "km"
            } else if outputDisplay.text!.contains("mi") {
                inputDisplay.text = "km"
                outputDisplay.text = "mi"
            }
        }
  
        
    } //func end
    
    func fahToCel(inputNum: Double) -> Double {
        var outputNum:Double
        outputNum = (inputNum - 32) * (5/9)
        return outputNum
    }
    
    func celToFah(inputNum: Double) -> Double {
        var outputNum:Double
        outputNum = (inputNum * (9/5) + 32)
        return outputNum
    }
    func kmToMi(inputNum: Double) -> Double {
        var outputNum: Double
        outputNum = inputNum * 0.62137
        
        return outputNum
    }
    func miToKm(inputNum: Double) -> Double {
        var outputNum: Double
        
        outputNum = inputNum * 1.60934
        
        return outputNum
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
