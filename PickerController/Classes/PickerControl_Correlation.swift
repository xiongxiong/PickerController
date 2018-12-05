//
//  CorrelationPickerView.swift
//  CorrelationPicker
//
//  Created by 王继荣 on 29/10/2016.
//  Copyright © 2016 snowflyer. All rights reserved.
//

import UIKit

public class PickerControl_Correlation: PickerControl_Base {
    
    var dataSource: TreeNode
    var numberOfComponents: Int
    var onDone: ClosureDoneWithTreeNode?
    
    override var pickerView: UIView {
        return _pickerView
    }
    
    var _pickerView = UIPickerView()
    
    public convenience init(jsonStr: String) {
        let data = try! JSONDecoder().decode(TreeNode.self, from: jsonStr.data(using: .utf8)!)
        self.init(data: data)
    }
    
    public init(data: TreeNode) {
        dataSource = data
        numberOfComponents = dataSource.height - 1
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
            var nodes = dataSource.nodes
            if index > 0 {
                for i in 1...index {
                    let selectedIndex = _pickerView.selectedRow(inComponent: i - 1)
                    nodes = nodes?[selectedIndex].nodes
                }
            }
            let rows = nodes?.map({ (node) -> String in
                return node.value ?? ""
            })
            if let row = rows?.index(of: item) {
                _pickerView.selectRow(row, inComponent: index, animated: false)
                if index < numberOfComponents - 1 {
                    _pickerView.reloadComponent(index + 1)
                }
            } else {
                print("not valid : index -- \(index), item -- \(item)")
                return
            }
        }
    }
    
    override func didDone() {
        super.didDone()
        let indices = (0..<numberOfComponents).map { (index) -> Int in
            return _pickerView.selectedRow(inComponent: index)
        }
        let items = (0..<numberOfComponents).map { (index) -> TreeNode in
            var treeNodes = dataSource.nodes
            if index > 0 {
                for i in 0..<index {
                    treeNodes = treeNodes?[indices[i]].nodes
                }
            }
            return treeNodes![indices[index]]
        }
        onDone?(indices, items)
    }
}

extension PickerControl_Correlation: UIPickerViewDelegate {
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var treeNodes = dataSource.nodes
        if component > 0 {
            for i in 1...component {
                let selectedIndex = pickerView.selectedRow(inComponent: i - 1)
                treeNodes = treeNodes?[selectedIndex].nodes
            }
        }
        return treeNodes?[row].displayName ?? treeNodes?[row].value
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component < numberOfComponents - 1 {
            pickerView.reloadComponent(component + 1)
        }
    }
}

extension PickerControl_Correlation: UIPickerViewDataSource {
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return numberOfComponents
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var treeNodes = dataSource.nodes
        if component > 0 {
            for i in 1...component {
                let selectedIndex = pickerView.selectedRow(inComponent: i - 1)
                treeNodes = treeNodes?[selectedIndex].nodes
            }
        }
        return treeNodes?.count ?? 0
    }
}
