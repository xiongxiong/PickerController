//
//  ViewController.swift
//  CorrelationPicker-Example
//
//  Created by 王继荣 on 29/10/2016.
//  Copyright © 2016 snowflyer. All rights reserved.
//

import UIKit
import PickerController

class ViewController: UIViewController {

    var button1 = UIButton(type: .system)
    var button2 = UIButton(type: .system)
    var button3 = UIButton(type: .system)
    var labelIndices = UILabel()
    var labelItems = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.setTitle("GroupPicker", for: .normal)
        button1.addTarget(self, action: #selector(onClicked_button1), for: .touchUpInside)
        view.addSubview(button1)
        view.addConstraint(NSLayoutConstraint(item: button1, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: button1, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 100))
        
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.setTitle("CorrelationPicker", for: .normal)
        button2.addTarget(self, action: #selector(onClicked_button2), for: .touchUpInside)
        view.addSubview(button2)
        view.addConstraint(NSLayoutConstraint(item: button2, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: button2, attribute: .top, relatedBy: .equal, toItem: button1, attribute: .bottom, multiplier: 1, constant: 30))
        
        button3.translatesAutoresizingMaskIntoConstraints = false
        button3.setTitle("DatePicker", for: .normal)
        button3.addTarget(self, action: #selector(onClicked_button3), for: .touchUpInside)
        view.addSubview(button3)
        view.addConstraint(NSLayoutConstraint(item: button3, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: button3, attribute: .top, relatedBy: .equal, toItem: button2, attribute: .bottom, multiplier: 1, constant: 30))
        
        labelIndices.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelIndices)
        view.addConstraint(NSLayoutConstraint(item: labelIndices, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: labelIndices, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -30))
        
        labelItems.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelItems)
        view.addConstraint(NSLayoutConstraint(item: labelItems, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: labelItems, attribute: .bottom, relatedBy: .equal, toItem: labelIndices, attribute: .top, multiplier: 1, constant: -30))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func onClicked_button1() {
        let data = [["1983", "1984", "1985"], ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"]]
        showGroupPicker(title: "Hello", groupData: data, selectedItems: ["1984", "6月"], onDone: { [unowned self] (indices, items) in
            self.labelIndices.text = "indices -- \(indices)"
            self.labelItems.text = "items -- \(items)"
            }, onCancel: {
               self.labelIndices.text = "selected nothing"
                self.labelItems.text = "selected nothing"
        })
    }
    
    func onClicked_button2() {
        showPicker_ChineseRegionalism(title: "城市", selectedItems: ["江苏", "无锡"], onDone: { [unowned self] (indices, items) in
            self.labelIndices.text = "indices -- \(indices)"
            self.labelItems.text = "items -- \(items)"
            }, onCancel: {
                self.labelIndices.text = "selected nothing"
                self.labelItems.text = "selected nothing"
        })
    }
    
    func onClicked_button3() {
        showDatePicker(title: "时间", initialDate: Date(), onDone: { [unowned self] (date) in
            self.labelIndices.text = ""
            self.labelItems.text = "date -- \(date)"
            }, onCancel: {
                self.labelIndices.text = ""
                self.labelItems.text = "selected nothing"
        })
    }
}

