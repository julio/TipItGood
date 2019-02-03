//
//  TipCalc.swift
//
//  Created by Julio Santos on 8/13/16.
//  Copyright © 2016 Julio Santos. All rights reserved.
//

import Foundation

class TipCalc {
    private var _billAmount      = 0.0
    private var _tipPercent      = 0.0
    private var _tipAmount       = 0.0
    private var _totalAmount     = 0.0
    private var _eachSplitAmount = 0.0
    private var _numberOfSplits  = 1

    var billAmount: Double {
        get {
            return _billAmount
        }
        set {
            _billAmount = newValue
        }
    }

    var tipPercent: Double {
        get {
            return _tipPercent
        }
        set {
            _tipPercent = newValue
        }
    }
    
    var tipAmount: Double {
        return _tipAmount
    }

    var numberOfSplits: Int {
        get {
            return _numberOfSplits
        }
        set {
            _numberOfSplits = newValue
        }
    }
    
    var eachSplitAmount: Double {
        return totalAmount / Double(numberOfSplits)
    }
    
    var totalAmount: Double {
        return ceil(_totalAmount)
    }
    
    init(billAmount: Double, tipPercent: Double) {
        _billAmount = billAmount
        _tipPercent = tipPercent
    }
    
    func calculateAmounts() {
        _tipAmount   = billAmount * tipPercent
        _totalAmount = billAmount + _tipAmount
    }

    func calculateSplits() {
        _eachSplitAmount = eachSplitAmount
    }
}
