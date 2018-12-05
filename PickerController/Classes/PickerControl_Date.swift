//
//  PickerView_Date.swift
//  CorrelationalPicker-Example
//
//  Created by 王继荣 on 10/11/2016.
//  Copyright © 2016 snowflyer. All rights reserved.
//

import UIKit

public typealias ClosureDateDone = (_ date: Date) -> Void

public class PickerControl_Date: PickerControl_Base {

    var onDone: ClosureDateDone?
    
    override var pickerView: UIView {
        return datePicker
    }
    
    var datePicker = UIDatePicker()

    func configureDatePicker(_ configClosure: ((UIDatePicker) -> Void)?) {
        configClosure?(datePicker)
    }
    
    override func didDone() {
        super.didDone()
        onDone?(datePicker.date)
    }
}
