//
//  LoveTweetViewController.swift
//  SwiftProductStudy
//
//  Created by vinci on 2017/7/4.
//  Copyright © 2017年 vinci. All rights reserved.
//

import UIKit
import Social

class LoveTweetViewController: UIViewController {

    var tweet: String?
    
    //MARK: Property
    
    var salaryLabel: UILabel!
    var straightSwitch: UISwitch!
    var nameTextField: UITextField!
    var workTextField: UITextField!
    var birthdayPicker: UIDatePicker!
    var genderSeg: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func salaryhandler(_ sender: AnyObject) {
        let slider = sender as! UISlider
        let i = Int(slider.value)
        salaryLabel.text = "$\(i)k"
    }
    
    func tweetTapped(_ sender: AnyObject) {
        guard let name = nameTextField.text,
            let work = workTextField.text,
            let salary = salaryLabel.text
            else { return }
        if name == "" || work == "" || salary == "" {
            showAlert("Info Miss", message: "Please fill out the form", buttonTitle: "ok")
        }
        
        //MARK: Get age
        let now = Date()
        let gregorian = Calendar(identifier: Calendar.Identifier.gregorian)
        let components = (gregorian as NSCalendar?)?.components(NSCalendar.Unit.year, from: birthdayPicker.date, to: now, options: []);
        let age: Int? = components?.year
        
        var interestdIn: String! = "Women"
        if (genderSeg.selectedSegmentIndex == 0 && !straightSwitch.isOn) {
            interestdIn = "Men"
        } else if (genderSeg.selectedSegmentIndex == 1 && straightSwitch.isOn) {
            interestdIn = "Women"
        }
        
        let tweet = "Hi, I am \(name). As a \(age!)-year-old \(work) earning \(salary)/year, I am interested in \(interestdIn). Feel free to contact me!"
        
        tweetSLCVC(tweet)
    }
    
    fileprivate func tweetSLCVC(_ tweet: String) {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
            let twitterController: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            self.present(twitterController, animated: true, completion: nil)
        } else {
            showAlert("Twitter Unavailable", message: "Please configure your twitter account on device", buttonTitle: "Ok")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func showAlert(_ title: String, message: String, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event);
        view.endEditing(true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
