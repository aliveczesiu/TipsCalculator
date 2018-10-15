//
//  ViewController.swift
//  TipsCalculator
//
//  Created by Krzysztof Synowiec on 27/06/2018.
//  Copyright © 2018 Krzysztof Synowiec. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var tipPercentageLbl: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
   
    var tip = TipModel(billAmount: 0.0, tipPercent: 0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTipCalculationValues()
        updateUI()
        
    }

    func setTipCalculationValues() {
        tip.tipPercent = Double(tipPercentageSlider.value)
        tip.billAmount = ((textField.text)! as NSString).doubleValue
        tip.calculateTip()
    }

    func updateUI() {
        tipLabel.text = String(format: "$%0.2f", tip.tipAmount)
        totalLabel.text = String(format: "$%0.2f", tip.totalAmount)
        tipPercentageLbl.text = "Tip:\(Int(tipPercentageSlider.value*100))%"
    }
    @IBAction func billAmountDidChange(_ sender: Any) {
        setTipCalculationValues()
        updateUI()
    }
    @IBAction func tipPercentageDidChange(_ sender: Any) {
      //  let steps: Float = 100
      //  let roundedValue = round(sender.value * steps)
      //  sender.value = roundedValue
        
        setTipCalculationValues()
        updateUI()
    }
    
}

