//
//  CreateHangoutOrMeetPeopleViewController.swift
//  friendly
//
//  Created by Daniel Christopher on 5/30/16.
//  Copyright © 2016 Daniel Christopher. All rights reserved.
//

import UIKit

class CreateHangoutOrMeetPeopleViewController: UIViewController {
    
    @IBOutlet weak var messageTextField: KaedeTextField!

    @IBOutlet weak var addTimeButton: UIButton!
    
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sendButton.layer.cornerRadius = 8
        sendButton.layer.borderColor = UIColor.whiteColor().CGColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onAddTimeClicked(sender: UIButton) {
        let width = self.view.frame.width - 25
        let appearance = SCLAlertView.SCLAppearance(kWindowWidth: width)
        
        let alert = SCLAlertView(appearance: appearance)
        
        let datePicker = UIDatePicker()
        datePicker.transform = CGAffineTransformMakeScale(0.8, 0.8);
        datePicker.frame = CGRect(x: 0, y: 0, width: width, height: 300)
        
        alert.customSubview = datePicker
     
        alert.showEdit(
            "When?",
            subTitle: "",
            colorStyle: 0x2196F3,
            colorTextButton: 0xFFFFFF
        )
    }
}