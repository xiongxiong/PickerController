//
//  CommonPicker.swift
//  CorrelationPicker
//
//  Created by 王继荣 on 09/11/2016.
//  Copyright © 2016 snowflyer. All rights reserved.
//

import UIKit

public typealias ClosureDone = (_ selectedIndices: [Int], _ selectedStrings: [String]) -> Void
public typealias ClosureCancel = () -> Void

public class PickerControl_Base: UIControl {
    
    var pickerView: UIView {
        return UIView()
    }
    var toolBar = UIView()
    var titleLabel = UILabel()
    var cancelBtn = UIButton(type: .system)
    var doneBtn = UIButton(type: .system)
    var onCancel: ClosureCancel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(toolBar)
        addSubview(pickerView)
        
        toolBar.addSubview(cancelBtn)
        toolBar.addSubview(doneBtn)
        toolBar.addSubview(titleLabel)
        
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint(item: toolBar, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: toolBar, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: toolBar, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: toolBar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 40))
        
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint(item: pickerView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: pickerView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: toolBar, attribute: .bottom, relatedBy: .equal, toItem: pickerView, attribute: .top, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: pickerView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0))
        
        cancelBtn.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint(item: cancelBtn, attribute: .leading, relatedBy: .equal, toItem: toolBar, attribute: .leading, multiplier: 1, constant: 15))
        addConstraint(NSLayoutConstraint(item: cancelBtn, attribute: .top, relatedBy: .equal, toItem: toolBar, attribute: .top, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: cancelBtn, attribute: .bottom, relatedBy: .equal, toItem: toolBar, attribute: .bottom, multiplier: 1, constant: 0))
        cancelBtn.setTitle("Cancel", for: .normal)
        cancelBtn.addTarget(self, action: #selector(didCancel), for: .touchUpInside)
        
        doneBtn.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint(item: doneBtn, attribute: .trailing, relatedBy: .equal, toItem: toolBar, attribute: .trailing, multiplier: 1, constant: -15))
        addConstraint(NSLayoutConstraint(item: doneBtn, attribute: .top, relatedBy: .equal, toItem: toolBar, attribute: .top, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: doneBtn, attribute: .bottom, relatedBy: .equal, toItem: toolBar, attribute: .bottom, multiplier: 1, constant: 0))
        doneBtn.setTitle("Done", for: .normal)
        doneBtn.addTarget(self, action: #selector(didDone), for: .touchUpInside)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .centerX, relatedBy: .equal, toItem: toolBar, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: toolBar, attribute: .top, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .bottom, relatedBy: .equal, toItem: toolBar, attribute: .bottom, multiplier: 1, constant: 0))
        titleLabel.textAlignment = .center
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func didCancel() {
        onCancel?()
    }
    
    func didDone() {
        // abstract method
    }
    
    func setTitle(title: String) {
        titleLabel.text = title
    }
}
