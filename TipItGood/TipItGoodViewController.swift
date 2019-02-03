//
//  TipItGoodViewController.swift
//
//  Created by Julio Santos on 8/11/16.
//  Copyright © 2016 Julio Santos. All rights reserved.
//

import UIKit

class TipItGoodViewController: UIViewController {

    // @IBOutlets
    @IBOutlet weak var billAmountTextField:  UITextField!
    @IBOutlet weak var tipPercentLabel:      UILabel!
    @IBOutlet weak var tipPercentSlider:     UISlider!
    @IBOutlet weak var tipAmountLabel:       UILabel!
    @IBOutlet weak var totalAmountLabel:     UILabel!
    @IBOutlet weak var numberOfSplitsLabel:  UILabel!
    @IBOutlet weak var eachSplitAmount:      UILabel!
    @IBOutlet weak var numberOfSplitsSlider: UISlider!
    
    // @Properties
    var tipCalc = TipCalc(billAmount: 0.0, tipPercent: 0.2) // default to 20% tip
    
    // Initialize Views
    
    override func viewDidLoad() {
        super.viewDidLoad()

        billAmountTextField.layer.masksToBounds = true
        billAmountTextField.layer.cornerRadius = 10
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        billAmountTextField.becomeFirstResponder()
    }

    // @IBActions
    @IBAction func amountIsReady(_ sender: AnyObject) {
        tipCalc.tipPercent = 0.2
        tipPercentSlider.setValue(0.2, animated: true)
        tipCalc.numberOfSplits = 1
        numberOfSplitsSlider.setValue(1, animated: true)
        billAmountTextField.resignFirstResponder()
        calculateTip()
        updateUI()
    }

    @IBAction func billAmountChanged(_ sender: AnyObject) {
        calculateTip()
        updateUI()
    }
    
    @IBAction func tipPercentChanged(_ sender: AnyObject) {
        calculateTip()
        updateUI()
    }
    @IBAction func numberOfSplitsChanged(_ sender: AnyObject) {
        calculateSplits()
        updateUI()
    }
    
    // Functions
    
    func calculateTip() {
        tipCalc.tipPercent = Double(tipPercentSlider.value)
        tipCalc.billAmount = ((billAmountTextField.text)! as NSString).doubleValue
        tipCalc.calculateAmounts()
    }

    func calculateSplits() {
        tipCalc.numberOfSplits = Int(numberOfSplitsSlider.value)
        tipCalc.calculateSplits()
    }
    
    func updateUI() {
        tipAmountLabel.text = String(format: "$%0.2f", tipCalc.tipAmount)
        totalAmountLabel.text = String(format: "$%0.2f", tipCalc.totalAmount)
        tipPercentLabel.text = "Tip (\(Int(100 * tipPercentSlider.value))%)"
        eachSplitAmount.text = String(format: "$%0.2f", tipCalc.eachSplitAmount)
        numberOfSplitsLabel.text = "Splits: (\(tipCalc.numberOfSplits))"
    }
}
