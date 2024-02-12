//
//  ViewController.swift
//  Assignment5
//
//  Created by James Kowalski on 2/7/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblAdventureDescription: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var btnChoice1: UIButton!
    @IBOutlet weak var btnChoice2: UIButton!
    @IBOutlet weak var btnChoice3: UIButton!
    
    var objAdventureLogic = AdventureLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    @IBAction func btnChoice_Action(_ sender: UIButton) {
        if sender == btnChoice1
        {
            objAdventureLogic.setChoice(intChoice: 0)
        } else if sender == btnChoice2
        {
            objAdventureLogic.setChoice(intChoice: 1)
        } else if sender == btnChoice3
        {
            objAdventureLogic.setChoice(intChoice: 2)
        }
        updateUI()
    }
  
    @objc func updateUI()
    {
        
        lblAdventureDescription.text = objAdventureLogic.getAdventureDescription()
        lblTitle.text = objAdventureLogic.getAdventureTitle()
        setButtonTextAndVisibility(objButton: btnChoice1, 
                                   strButtonText: objAdventureLogic.getButtonText(intChoice: 0))
        setButtonTextAndVisibility(objButton: btnChoice2, strButtonText: objAdventureLogic.getButtonText(intChoice: 1))
        setButtonTextAndVisibility(objButton: btnChoice3, strButtonText: objAdventureLogic.getButtonText(intChoice: 2))
    }
    func setButtonTextAndVisibility(objButton: UIButton, strButtonText: String)
    {
        objButton.setTitle(strButtonText, for: .normal)
        objButton.isHidden = strButtonText == ""
    }
}
