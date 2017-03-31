//
//  HoroscopeService.swift
//  Horoscope
//
//  Created by Lakshmi Bomma on 9/29/16.
//  Copyright © 2016 RIIS. All rights reserved.
//

import Foundation

class HoroscopeService
{
    static var horoscopeUrl:String = ""

    class var sharedInstance :HoroscopeService
    {
        struct Singleton
        {
            static let instance = HoroscopeService()
        }
        
        return Singleton.instance
    }
    
    func appendURL (sign:String) -> String {
        let baseURL = "http://www.findyourfate.com/rss/dailyhoroscope-feed.asp"
        let findYourFateID = "45"
        let completedURL = baseURL + "?sign=" + sign + "&id=" + findYourFateID
        return completedURL
    }
    
    func callDailyhoroscopeApi(sign:String,parameters: AnyObject?,
                         success: (( _ resp: Data) -> Void)?,
                         failure: (( _ error: NSError? ) -> Void)?)
    {
        
        let urlString = appendURL(sign: sign)
        let url = URL(string: urlString)
        let request = NSMutableURLRequest(url: url!)
        let session = URLSession.shared
        request.httpMethod = "GET"
        request.addValue("application/xml", forHTTPHeaderField: "Content-Type")
        request.addValue("application/xml", forHTTPHeaderField: "Accept")
        
        
        let task = session.dataTask(with: request as URLRequest, completionHandler:
            {
                data, response, error -> Void in
                let httpResponse = response as! HTTPURLResponse
                let strData = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print("Body: \(strData)")
                
                if httpResponse.statusCode == 200
                {
                    DispatchQueue.main.async(execute: { () -> Void in
                        success!(data!)
                    })
                }
                else
                {
                    DispatchQueue.main.async(execute: { () -> Void in
                        
                        failure!(error as NSError?)
                })
            }
        })
        task.resume()
    }
}
