//
//  CorrelationPickerView.swift
//  CorrelationPicker
//
//  Created by 王继荣 on 29/10/2016.
//  Copyright © 2016 snowflyer. All rights reserved.
//

import UIKit

public class PickerControl_Group: PickerControl_Base {
    
    var dataSource: [[String]]
    var onDone: ClosureDone?
    
    override var pickerView: UIView {
        return _pickerView
    }
    
    var _pickerView = UIPickerView()
    
    public init(data: [[String]]) {
        dataSource = data
        super.init(frame: CGRect.zero)
        
        _pickerView.delegate = self
        _pickerView.dataSource = self
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSelected(indices: [Int]) {
        indices.enumerated().forEach { (index, value) in
            _pickerView.selectRow(value, inComponent: index, animated: false)
        }
    }
    
    func setSelected(items: [String]) {
        items.enumerated().forEach { (index, item) in
            let row = dataSource[index].index(of: item) ?? 0
            _pickerView.selectRow(row, inComponent: index, animated: false)
        }
    }
    
    override func didDone() {
        super.didDone()
        let indices = (0..<dataSource.count).map { (index) -> Int in
            return _pickerView.selectedRow(inComponent: index)
        }
        let items = (0..<dataSource.count).map { (index) -> String in
            return dataSource[index][_pickerView.selectedRow(inComponent: index)]
        }
        onDone?(indices, items)
    }
}

extension PickerControl_Group: UIPickerViewDelegate {
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[component][row]
    }
}

extension PickerControl_Group: UIPickerViewDataSource {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return dataSource.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource[component].count
    }
}
