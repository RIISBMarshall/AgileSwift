//
//  ViewController.swift
//  Companion
//
//  Created by Lakshmi Bomma on 10/5/16.
//  Copyright © 2016 riis. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController
{
    @IBOutlet weak var birthDate: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    var userDefaultsMock: UserDefaultsMock?
    var age: Int?
    // MARK: - View Life Cycle

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Login"
        
        userDefaultsMock?.standardUserDefaults = UserDefaults.standard
        getUserDetailsFromDefaults()
    }
    


    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Helper methods
    
    func getUserDetailsFromDefaults()
    {
        
        let savedUsername = userDefaultsMock?.standardUserDefaults?.string(forKey: "Username")
        
        if ((savedUsername?.characters.count) != nil)
        {
            self.username.text = savedUsername
        }
        
        let savedPassword = userDefaultsMock?.standardUserDefaults?.string(forKey: "Password")
        
        if ((savedPassword?.characters.count) != nil)
        {
            self.password.text = savedPassword
        }
        
        let savedBirthdate = userDefaultsMock?.standardUserDefaults?.string(forKey: "Birthdate")
        
        if ((savedBirthdate?.characters.count) != nil)
        {
            self.birthDate.text = savedBirthdate
            
            self.datePicker.isHidden = false
            let dateFormatter = DateFormatter()
            
            dateFormatter.dateStyle = DateFormatter.Style.medium
            
            let date = dateFormatter.date(from:savedBirthdate!)
            datePicker.date = date!
        }
    }
    
    func displayAlert(_ type:String,message:String)
    {
        let alertController = UIAlertController(title: type, message:message, preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func getCurretDateString()->String
    {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        
        let strDate = dateFormatter.string(from: datePicker.date)
        
        return strDate
    }
    
    // MARK: - Action methods
    
    @IBAction func onSelectSave(_ sender: AnyObject)
    {
        if username.text?.characters.count == 0
        {
            displayAlert("", message: "Username is required")
            return
        }
        if password.text?.characters.count == 0
        {
            displayAlert("", message: "Password is required")
            return
        }
        if birthDate.text?.characters.count == 0
        {
            displayAlert("", message: "Birthdate is required")
            return
        }
        
        self.performSegue(withIdentifier: "showDetail", sender: self)
    }
    

    @IBAction func onSelectBirthDate(_ sender: AnyObject)
    {
        self.username.resignFirstResponder()
        self.password.resignFirstResponder()
        self.birthDate.resignFirstResponder()
        self.datePicker.isHidden = false
    }
    
    @IBAction func onSelectDatePicker(_ sender: AnyObject)
    {
        birthDate.text = self.getCurretDateString()
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "showDetail")
        {
            userDefaultsMock?.standardUserDefaults?.set(self.username.text, forKey: "Username")
            userDefaultsMock?.standardUserDefaults?.set(self.password.text, forKey: "Password")
            userDefaultsMock?.standardUserDefaults?.set(self.birthDate.text, forKey: "Birthdate")
            
            let user = User(uName: self.username.text!, pword: self.password.text!, date: self.birthDate.text!)
                let userDetailViewController:UserDetailsViewController = segue.destination as! UserDetailsViewController
            userDetailViewController.user = user
        }
    }

}


