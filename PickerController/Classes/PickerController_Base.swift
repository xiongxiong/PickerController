//
//  WonderPicker.swift
//  CorrelationPicker
//
//  Created by 王继荣 on 09/11/2016.
//  Copyright © 2016 snowflyer. All rights reserved.
//

import UIKit

public class PickerController_Base: UIViewController {

    public var height: CGFloat = 260
    public var animationDuration: TimeInterval = 0.3
    public var backgroundAlpha: CGFloat = 0.3
    
    var pickerControl: PickerControl_Base {
        return PickerControl_Base()
    }
    var bottomConstraint: NSLayoutConstraint?
    
    init(title:String, onCancel: ClosureCancel? = nil) {
        super.init(nibName: nil, bundle: nil)
        setTitle(title: title)
        setCancelAction(onCancel)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

    public override func loadView() {
        super.loadView()
        
        view.addSubview(pickerControl)
        pickerControl.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraint(NSLayoutConstraint(item: pickerControl, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: pickerControl, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: pickerControl, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: height))
        let bottomConstraint = NSLayoutConstraint(item: pickerControl, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: height)
        view.addConstraint(bottomConstraint)
        self.bottomConstraint = bottomConstraint
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black.withAlphaComponent(backgroundAlpha)
        pickerControl.backgroundColor = UIColor.white
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animateToOpen()
    }
    
    func setTitle(title: String) {
        pickerControl.setTitle(title: title)
    }
    
    func setCancelAction(_ onCancel: ClosureCancel?) {
        pickerControl.onCancel = { [weak self] in
            self?.animateToClose { (finished) in
                if finished {
                    self?.dismiss(animated: false, completion: onCancel)
                }
            }
        }
    }
    
    func animateToOpen(completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: animationDuration, animations: { [unowned self] in
            self.bottomConstraint?.constant = 0
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
        }, completion: completion)
    }
    
    func animateToClose(completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: animationDuration, animations: { [unowned self] in
            self.bottomConstraint?.constant = self.height
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
        }, completion: completion)
    }
}
