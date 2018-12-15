//
//  PickerController_Date.swift
//  CorrelationalPicker-Example
//
//  Created by 王继荣 on 10/11/2016.
//  Copyright © 2016 snowflyer. All rights reserved.
//

import UIKit

public class PickerController_Date: PickerController_Base {

    override var pickerControl: PickerControl_Base {
        return _pickerControl
    }
    
    var _pickerControl: PickerControl_Date
    
    public init(title:String, onDone: ClosureDateDone? = nil, onCancel: ClosureCancel? = nil) {
        _pickerControl = PickerControl_Date()
        super.init(title: title, onCancel: onCancel)
        setDoneAction(onDone)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configureDatePicker(_ configClosure: ((UIDatePicker) -> Void)?) {
        _pickerControl.configureDatePicker(configClosure)
    }
    
    public func setDoneAction(_ onDone: ClosureDateDone?) {
        _pickerControl.onDone = { [weak self] (date) in
            self?.animateToClose { (finished) in
                if finished {
                    self?.dismiss(animated: false, completion: {
                        onDone?(date)
                    })
                }
            }
        }
    }
}
