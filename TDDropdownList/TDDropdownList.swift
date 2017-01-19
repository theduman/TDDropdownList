//
//  TDDropdownList.swift
//  TDDropdownList
//
//  Created by Emre Duman on 18/01/17.
//  Copyright © 2017 theduman. All rights reserved.
//

import UIKit


@objc public protocol TDDropdownListDelegate {
    func listTapped(sender: UIButton)
}

open class TDDropdownList: UIView {
    var xCoordination: CGFloat = 0.0
    var yCoordination: CGFloat = 0.0
    var itemWidth: CGFloat = 0.0
    var itemHeight: CGFloat = 0.0
    var dropDownData: [String] = []
    var isActive = false
    var selectedItem = UIButton(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    open var delegate: TDDropdownListDelegate?
    var animationTimer: Double = Double()
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.itemWidth = frame.width
        self.itemHeight = frame.height
        self.xCoordination = frame.origin.x
        self.yCoordination = frame.origin.y
        backgroundColor = .clear
        let gesture = UITapGestureRecognizer()
        gesture.numberOfTapsRequired = 1
        gesture.addTarget(self, action: #selector(activate(sender:)))
        addGestureRecognizer(gesture)
    }
    open func initialize(data: [String],selectedItemColor: UIColor = UIColor(red:0.74, green:0.03, blue:0.11, alpha:1.00),itemColor:UIColor = UIColor(red:0.03, green:0.30, blue:0.53, alpha:1.00),textColor: UIColor = .white,selectedItemPlaceholder:String = "\u{02304}" , animationTimer: Double = 0.5) {
        self.dropDownData = data
        var newFrame: CGRect = CGRect.zero;
        newFrame = CGRect(x: self.xCoordination, y: self.yCoordination, width:itemWidth, height: itemHeight * CGFloat(dropDownData.count + 1))
        super.frame = newFrame;
        self.animationTimer = animationTimer
        selectedItem = UIButton(frame: CGRect(x: 0, y: 0, width: itemWidth, height: itemHeight))
        selectedItem.backgroundColor = selectedItemColor
        selectedItem.tag = 100
        selectedItem.layer.borderColor = UIColor.white.cgColor
        selectedItem.layer.borderWidth = 1
        selectedItem.layer.cornerRadius = 5
        selectedItem.setTitleColor(textColor, for: .normal)
        selectedItem.isHidden = false
        selectedItem.setTitle(selectedItemPlaceholder, for: .normal)
        selectedItem.addTarget(self, action: #selector(activate(sender:)), for: .touchUpInside)
        addSubview(selectedItem)

        for i in 0..<data.count {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: itemWidth, height: itemHeight))
            button.backgroundColor = itemColor
            button.tag = i
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.white.cgColor
            button.layer.cornerRadius = 5
            button.setTitleColor(textColor, for: .normal)
            button.isHidden = true
            button.setTitle("\(data[i])", for: .normal)
            button.addTarget(self, action: #selector(listTapped(sender:)), for: .touchUpInside)
            addSubview(button)
        }
    }
    @objc private func activate(sender: UIButton) {
        if isActive {
            bringSubview(toFront: selectedItem)
            selectedItem.setTitle(sender.currentTitle!, for: .normal)
            for i in subviews{
                if i.tag >= 0 && i.tag < dropDownData.count {
                    UIView.animate(withDuration: animationTimer, animations: {
                        i.layer.position.y -= self.itemHeight * CGFloat(i.tag + 1)
                    }, completion: {(data) in
                        i.isHidden = true
                    })
                }
            }
            isActive = false
            return
        }
        bringSubview(toFront: selectedItem)
        for i in subviews{
            if i.tag >= 0 && i.tag < dropDownData.count {
                i.isHidden = false
                UIView.animate(withDuration: animationTimer, animations: {
                    i.layer.position.y += self.itemHeight * CGFloat(i.tag + 1)
                })
            }
        }
        isActive = true
        return
    }
    open func listTapped(sender: UIButton) {
        activate(sender: sender)
        delegate?.listTapped(sender: sender)
    }
    convenience init () {
        self.init(frame:CGRect.zero)
    }

    required public init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
}
