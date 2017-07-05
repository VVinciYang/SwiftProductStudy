//
//  DetailViewController.swift
//  SwiftProductStudy
//
//  Created by vinci on 2017/7/5.
//  Copyright © 2017年 vinci. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var childButton: UIButton!
    var phoneButton: UIButton!
    var shoppingCartButton: UIButton!
    var travelButton: UIButton!
    var todoTitleLabel: UITextField!
    var todoDatePicker: UIDatePicker!

    var todo: TodoItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let todo = todo {
            self.title = "Edit Todo"
            
            if todo.image == "child-selected" {
                childButton.isSelected = true
            }else if todo.image == "phone-selected" {
                phoneButton.isSelected = true
            }else if todo.image == "shopping-cart-selected" {
                shoppingCartButton.isSelected = true
            }else if todo.image == "travel-selected" {
                travelButton.isSelected = true
            }
            
            todoTitleLabel.text = todo.title
            todoDatePicker.setDate(todo.date, animated: false)
        }else {
            title = "New Todo"
            childButton.isSelected = true
        }

        // Do any additional setup after loading the view.
    }
    
    func selectChild(_ sender: AnyObject){
        resetButton()
        childButton.isSelected = true
    }
    
    func selectPhone(_ sender: AnyObject){
        resetButton()
        phoneButton.isSelected = true
    }
    
    func selectShoppingCart(_ sender: AnyObject){
        resetButton()
        shoppingCartButton.isSelected = true
    }
    
    func selectTravel(_ sender: AnyObject){
        resetButton()
        shoppingCartButton.isSelected = true
    }
    
    func resetButton(){
        childButton.isSelected = false
        phoneButton.isSelected = false
        shoppingCartButton.isSelected = false
        travelButton.isSelected = false
    }
    
    //MARK : create or edit a new todo
    
    
    func tapDone(_ sender: AnyObject) {
        var image = ""
        if childButton.isSelected {
            image = "child-selected"
        }
        else if phoneButton.isSelected {
            image = "phone-selected"
        }
        else if shoppingCartButton.isSelected {
            image = "shopping-cart-selected"
        }
        else if travelButton.isSelected {
            image = "travel-selected"
        }
        
        if let todo = todo {
            todo.image = image
            todo.title = todoTitleLabel.text!
            todo.date = todoDatePicker.date
        } else {
            let uuid = UUID().uuidString
            todo = TodoItem(id: uuid, image: image, title: todoTitleLabel.text!, date: todoDatePicker.date)
            todos.append(todo!)
        }
        
        let _  = navigationController?.popToRootViewController(animated: true)
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
