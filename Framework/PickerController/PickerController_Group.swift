//
//  PickerController_Group.swift
//  CorrelationPicker-Example
//
//  Created by 王继荣 on 10/11/2016.
//  Copyright © 2016 snowflyer. All rights reserved.
//

import UIKit

public class PickerController_Group: PickerController_Base {
    
    override var pickerControl: PickerControl_Base {
        return _pickerControl
    }
    
    var _pickerControl: PickerControl_Group
    
    public init(title:String, groupData: [[String]], onDone: ClosureDone? = nil, onCancel: ClosureCancel? = nil) {
        _pickerControl = PickerControl_Group(data: groupData)
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
    
    public func setDoneAction(_ onDone: ClosureDone?) {
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
