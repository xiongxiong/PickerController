//
//  PickerController_Correlation.swift
//  CorrelationPicker-Example
//
//  Created by 王继荣 on 10/11/2016.
//  Copyright © 2016 snowflyer. All rights reserved.
//

import UIKit

public class PickerController_Correlation: PickerController_Base {

    override var pickerControl: PickerControl_Base {
        return _pickerControl
    }
    
    var _pickerControl: PickerControl_Correlation
    
    public init(title:String, correlationalJsonStr: String, onDone: ClosureDoneWithTreeNode? = nil, onCancel: ClosureCancel? = nil) {
        _pickerControl = PickerControl_Correlation(jsonStr: correlationalJsonStr)
        super.init(title: title, onCancel: onCancel)
        setDoneAction(onDone)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setSelected(items: [String]) {
        _pickerControl.setSelected(items: items)
    }
    
    public func setSelected(indices: [Int]) {
        _pickerControl.setSelected(indices: indices)
    }
    
    public func setDoneAction(_ onDone: ClosureDoneWithTreeNode?) {
        _pickerControl.onDone = { [weak self] (indices, items) in
            self?.animateToClose { (finished) in
                if finished {
                    self?.dismiss(animated: false, completion: {
                        onDone?(indices, items)
                    })
                }
            }
        }
    }
}
