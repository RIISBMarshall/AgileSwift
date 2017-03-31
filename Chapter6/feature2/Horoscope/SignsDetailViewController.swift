//
//  SignsDetailViewController.swift
//  Horoscope
//
//  Created by User on 9/27/16.
//  Copyright © 2016 RIIS. All rights reserved.
//

import UIKit

class SignsDetailViewController: UIViewController {

    var currentSignDetail:Int?
    
    @IBOutlet weak var signName: UILabel!
    @IBOutlet weak var signSymbol: UILabel!
    @IBOutlet weak var signMonth: UILabel!
    @IBOutlet weak var signDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let currentSignDetailValue =  currentSignDetail
        {
            signName.text = HoroscopeData.horoscopes[currentSignDetailValue].name
            signSymbol.text = HoroscopeData.horoscopes[currentSignDetailValue].symbol
            signMonth.text = HoroscopeData.horoscopes[currentSignDetailValue].month
            signDescription.text = HoroscopeData.horoscopes[currentSignDetailValue].description
            //signDescription.text = currentSignDetail?.description
        }
        
        // Do any additional setup after loading the view.
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
