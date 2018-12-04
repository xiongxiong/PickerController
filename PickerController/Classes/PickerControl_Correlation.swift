//
//  CorrelationPickerView.swift
//  CorrelationPicker
//
//  Created by 王继荣 on 29/10/2016.
//  Copyright © 2016 snowflyer. All rights reserved.
//

import UIKit
import SwiftyJSON

public class PickerControl_Correlation: PickerControl_Base {
    
    var dataSource: TreeNode<String>
    var numberOfComponents: Int
    var onDone: ClosureDone?
    
    override var pickerView: UIView {
        return _pickerView
    }
    
    var _pickerView = UIPickerView()
    
    public convenience init(jsonStr: String) {
        self.init(data: TreeNode<String>(value: ""))
//        if let dataFromStr = jsonStr.data(using: .utf8, allowLossyConversion: false) {
//            dataSource = getTreeNode(json: JSON(data: dataFromStr))
//            numberOfComponents = dataSource.height - 1
//        }
        dataSource = getTreeNode(json: JSON(parseJSON: jsonStr))
        numberOfComponents = dataSource.height - 1
    }
    
    public init(data: TreeNode<String>) {
        dataSource = data
        numberOfComponents = dataSource.height - 1
        super.init(frame: CGRect.zero)
        
        _pickerView.delegate = self
        _pickerView.dataSource = self
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getTreeNode(json: JSON) -> TreeNode<String> {
        let node = TreeNode<String>(value: json["value"].stringValue)
        json["nodes"].arrayValue.forEach { (subJson) in
            let subNode = getTreeNode(json: subJson)
            node.addChild(subNode)
        }
        return node
    }
    
    func setSelected(indices: [Int]) {
        indices.enumerated().forEach { (index, value) in
            _pickerView.selectRow(value, inComponent: index, animated: false)
        }
    }
    
    func setSelected(items: [String]) {
        items.enumerated().forEach { (index, item) in
            var nodes = dataSource.children
            if index > 0 {
                for i in 1...index {
                    let selectedIndex = _pickerView.selectedRow(inComponent: i - 1)
                    nodes = nodes[selectedIndex].children
                }
            }
            let rows = nodes.map({ (node) -> String in
                return node.value
            })
            if let row = rows.index(of: item) {
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
        let items = (0..<numberOfComponents).map { (index) -> String in
            return pickerView(_pickerView, titleForRow: _pickerView.selectedRow(inComponent: index), forComponent: index) ?? ""
        }
        onDone?(indices, items)
    }
}

extension PickerControl_Correlation: UIPickerViewDelegate {
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var treeNodes = dataSource.children
        if component > 0 {
            for i in 1...component {
                let selectedIndex = pickerView.selectedRow(inComponent: i - 1)
                treeNodes = treeNodes[selectedIndex].children
            }
        }
        return treeNodes[row].value
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
        var treeNodes = dataSource.children
        if component > 0 {
            for i in 1...component {
                let selectedIndex = pickerView.selectedRow(inComponent: i - 1)
                treeNodes = treeNodes[selectedIndex].children
            }
        }
        return treeNodes.count
    }
}
