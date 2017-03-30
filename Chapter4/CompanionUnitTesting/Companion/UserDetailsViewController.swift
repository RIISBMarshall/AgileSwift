//
//  UserDetailsViewController.swift
//  Companion
//
//  Created by Lakshmi Bomma on 10/5/16.
//  Copyright © 2016 riis. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController
{
    @IBOutlet weak var birthDate: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var age: UILabel!


    var user:User?
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "User Details"

        self.username.text = self.user?.username
        self.birthDate.text =  self.user?.birthDate
        self.user?.calculateAge()
        self.user?.checkForBirthday()
        
        if let age  = self.user?.age
        {
            if (self.user?.todayIsBirthday)!
            {
                displayAlert("Hello,Happy Birthday", message:"You are " + "\(age)" + " years old now")
            }
            self.age.text = "You are " + "\(age)" + " years old now"
        }
    }
    
    func displayAlert(_ type:String,message:String)
    {
        let alertController = UIAlertController(title: type, message:message, preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning()
    {
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
