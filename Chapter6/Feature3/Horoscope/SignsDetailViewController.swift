//
//  SignsDetailViewController.swift
//  Horoscope
//
//  Created by User on 9/27/16.
//  Copyright © 2016 RIIS. All rights reserved.
//

import UIKit

class SignsDetailViewController: UIViewController, XMLParserDelegate {

    var currentSignDetail:Int?
    
    @IBOutlet weak var signName: UILabel!
    @IBOutlet weak var signSymbol: UILabel!
    @IBOutlet weak var signMonth: UILabel!
    @IBOutlet weak var signDescription: UILabel!
    @IBOutlet weak var signHoroscope: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!

    
    var parser = XMLParser()
    var element = NSString()
    
    var horoscopeDescription = String()
    var insideAnItem = false

    // MARK: - View life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        if let currentSignDetailValue =  currentSignDetail
        {
            signName.text = HoroscopeData.horoscopes[currentSignDetailValue].name
            signSymbol.text = HoroscopeData.horoscopes[currentSignDetailValue].symbol
            signMonth.text = HoroscopeData.horoscopes[currentSignDetailValue].month
            signDescription.text = HoroscopeData.horoscopes[currentSignDetailValue].description

            self.callDailyhoroscopeApi(sign: HoroscopeData.horoscopes[currentSignDetailValue].name)
        }
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - API Call
    func callDailyhoroscopeApi(sign:String)
    {
        self.spinner.startAnimating()
        HoroscopeService.sharedInstance.callDailyhoroscopeApi(sign: sign, parameters: nil, success: {
            (data) in
            
            self.spinner.stopAnimating()

            self.parseXmlData(data: data)
            
            }) { (error) in
                self.spinner.stopAnimating()
        }
    }
    
    
    // MARK: - XMLParser
    func parseXmlData(data:Data)
    {
        //create xml parser
        self.parser = XMLParser(data: data) //create xml parser
        
        self.parser.delegate =  self
        self.parser.parse()
        
        let success:Bool = self.parser.parse()
        
        if success {
            
            print(success)
        }
    }

    // MARK: - XMLParser Delegate methods

    // didStartElement
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String])
    {

        element = elementName as NSString
        if (elementName as NSString).isEqual(to: "item")
        {
            insideAnItem = true
            print(attributeDict)
        }
    }
    
    // foundCharacters
    func parser(_ parser: XMLParser, foundCharacters string: String)
    {
        
        if element.isEqual(to: "description") && insideAnItem == true
        {
            print("description is \(string)")
            self.horoscopeDescription =   string

        }
    }
    
    // didEndElement
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
       
    }

    func parserDidEndDocument(_ parser: XMLParser)
    {
        DispatchQueue.main.async {
            self.spinner.stopAnimating()
            //Display the data on UI

            self.signHoroscope.text =   self.horoscopeDescription
        }
        
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
