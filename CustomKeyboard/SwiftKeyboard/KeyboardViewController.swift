//
//  KeyboardViewController.swift
//  SwiftKeyboard
//
//  Copyright (c) bonegollira. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController
{
    
    let nextKeyboardButton: UIButton = UIButton.buttonWithType(.Custom) as UIButton
    let deleteButton: UIButton = UIButton.buttonWithType(.Custom) as UIButton
    let aButton: UIButton = UIButton.buttonWithType(.Custom) as UIButton
    let safariButton: UIButton = UIButton.buttonWithType(.Custom) as UIButton

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.nextKeyboardButton)
        self.view.addSubview(self.deleteButton)
        self.view.addSubview(self.aButton)
        self.view.addSubview(self.safariButton)
        
        self.configure()
    }
    
    override func viewDidLayoutSubviews()
    {
        let viewSize: CGSize = self.view.bounds.size;
        
        self.nextKeyboardButton.frame = CGRect(
            x: 0,
            y: viewSize.height - 44.0,
            width: viewSize.width,
            height: 44
        )
        
        self.deleteButton.frame = CGRect(
            x: 0,
            y: viewSize.height - 88,
            width: viewSize.width,
            height: 44
        )
        
        self.aButton.frame = CGRect(
            x: 0, y: 0,
            width: 50,
            height: 50
        )
        
        self.safariButton.frame = CGRect(
            x: viewSize.width - 60,
            y: 0,
            width: 60,
            height: 60
        )
    }
    
    func configure () {
        self.configure_self()
        self.configure__nextKeyboardButton()
        self.configure__aButton()
        self.configure__deleteButton()
        self.configure__safariButton()
    }
    
    func configure_self () {
        
    }
    
    func configure__nextKeyboardButton ()
    {
        self.nextKeyboardButton.backgroundColor = UIColor.grayColor()
        self.nextKeyboardButton.setTitle("next", forState: .Normal)
        self.nextKeyboardButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
    }
    
    func configure__deleteButton ()
    {
        self.deleteButton.backgroundColor = UIColor.blackColor()
        self.deleteButton.setTitle("delete", forState: .Normal)
        self.deleteButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.deleteButton.addTarget(self, action: "deleteBackward:", forControlEvents: .TouchUpInside)
    }
    
    func configure__aButton ()
    {
        self.aButton.layer.masksToBounds = true
        self.aButton.layer.cornerRadius = 4
        self.aButton.backgroundColor = UIColor.lightGrayColor()
        self.aButton.setTitle("a", forState: .Normal)
        self.aButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.aButton.addTarget(self, action: "a:", forControlEvents: .TouchUpInside)
    }
    
    func configure__safariButton ()
    {
        self.safariButton.layer.masksToBounds = true
        self.safariButton.layer.cornerRadius = 4
        self.safariButton.backgroundColor = UIColor.lightGrayColor()
        self.safariButton.setImage(UIImage(named: "Safari.png"), forState: .Normal)
        self.safariButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.safariButton.addTarget(self, action: "safari:", forControlEvents: .TouchUpInside)
    }
    
    
    func deleteBackward (sender: UIButton!) {
        (self.textDocumentProxy as UITextDocumentProxy).deleteBackward()
    }
    
    func a (sender: UIButton!) {
        (self.textDocumentProxy as UITextDocumentProxy).insertText("A")
    }
    
    func safari (sender: UIButton!) {
        (self.textDocumentProxy as UITextDocumentProxy).insertText("Safari")
    }

}
