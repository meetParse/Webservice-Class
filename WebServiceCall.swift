//
//  WebServiceCall.swift
//  realtynerd
//
//  Created by Rahul Patel on 12/9/17.
//  Copyright © 2017 RAHUL PATEL. All rights reserved.
//

import UIKit

class WebServiceCall: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
}

func showAlertMessage(vc: UIViewController, messageStr:String) -> Void {
        let alertMessage = UIAlertController(title: "Armonik".localiz(), message: messageStr, preferredStyle: .alert)
        alertMessage.addAction(UIAlertAction(title: "OK".localiz(), style: .default, handler: nil))
        vc.present(alertMessage, animated: true, completion: nil)
}

func post(params : NSDictionary, url : String, postCompleted : @escaping (_ succeeded: Bool, _ Response: NSDictionary) -> ()) {
    
    let strUserToken =  UserDefaults.standard.value(forKey: "user_token") as! String
    let request = NSMutableURLRequest(url: NSURL(string: "http://65.182.104.92:1005/api/\(url)")! as URL)
    
    let session = URLSession.shared
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("D02FB653-95C8-4BBC-B960-2A40800F94EF", forHTTPHeaderField: "api_key")
    request.addValue("Armonik1001", forHTTPHeaderField: "app_id")
    request.addValue("admin", forHTTPHeaderField: "token_source")
    request.addValue(strUserToken, forHTTPHeaderField: "person_token")
    
    request.httpBody = try! JSONSerialization.data(withJSONObject: params, options: [])
    
    
    let task = session.dataTask(with: request as URLRequest) { data, response, error in
        guard data != nil else {
            print("no data found: \(String(describing: error))")
            return
        }
        do {
            if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
                postCompleted(true, json)
            }
            else {
                let jsonStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)    // No error thrown, but not NSDictionary
                print("Error could not parse JSON: \(String(describing: jsonStr))")
            }
        } catch let parseError {
            print(parseError)                                                          // Log the error thrown by `JSONObjectWithData`
            let jsonStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("Error could not parse JSON: '\(String(describing: jsonStr))'")
        }
    }
    
    task.resume()
    
}

func post_String(url : String, postCompleted : @escaping (  _ succeeded: Bool,   _ Response: NSDictionary) -> ()) {
    
    let strUserToken =  UserDefaults.standard.value(forKey: "user_token") as! String
    let myUrl = URL(string:"http://65.182.104.92:1005/api/\(url)");
    var request = URLRequest(url:myUrl!)
    request.httpMethod = "POST"// Compose a query string
    
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("D02FB653-95C8-4BBC-B960-2A40800F94EF", forHTTPHeaderField: "api_key")
    request.addValue("Armonik1001", forHTTPHeaderField: "app_id")
    request.addValue("admin", forHTTPHeaderField: "token_source")
    request.addValue(strUserToken, forHTTPHeaderField: "person_token")
    
    let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
        
        if error != nil
        {
            print("error=\(String(describing: error))")
            return
        }
        
        // You can print out response object
        print("response = \(String(describing: response))")
        
        //Let's convert response sent from a server side script to a NSDictionary object:
        do {
            let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
            
            if json != nil {
                
                // Now we can access value of First Name by its key
                postCompleted(true, json!)
            }
        } catch {
            print(error)
        }
    }
    task.resume()
}


func Get(url : String, postCompleted : @escaping (_ succeeded: Bool, _ Response: NSDictionary) -> ()) {
    
    let strUserToken =  UserDefaults.standard.value(forKey: "user_token") as! String
    let request = NSMutableURLRequest(url: NSURL(string: "http://65.182.104.92:1005/api/\(url)/")! as URL)
    
    let session = URLSession.shared
    request.httpMethod = "GET"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("D02FB653-95C8-4BBC-B960-2A40800F94EF", forHTTPHeaderField: "api_key")
    request.addValue("Armonik1001", forHTTPHeaderField: "app_id")
    request.addValue("admin", forHTTPHeaderField: "token_source")
    request.addValue(strUserToken, forHTTPHeaderField: "person_token")    
    
    let task = session.dataTask(with: request as URLRequest) { data, response, error in
        guard data != nil else {
            print("no data found: \(String(describing: error))")
            return
        }
        do {
            if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
                postCompleted(true, json)
            }
            else {
                let jsonStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)    // No error thrown, but not NSDictionary
                print("Error could not parse JSON: \(String(describing: jsonStr))")
            }
        } catch let parseError {
            print(parseError)                                                          // Log the error thrown by `JSONObjectWithData`
            let jsonStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("Error could not parse JSON: '\(String(describing: jsonStr))'")
        }
    }
    
    task.resume()
    
}


func Get_String(url : String, postCompleted : @escaping (  _ succeeded: Bool,   _ Response: NSDictionary) -> ()) {
    
    let strUserToken =  UserDefaults.standard.value(forKey: "user_token") as! String
    let request = NSMutableURLRequest(url: NSURL(string: "http://65.182.104.92:1005/api/\(url)/")! as URL)
    
    let session = URLSession.shared
    request.httpMethod = "GET"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("D02FB653-95C8-4BBC-B960-2A40800F94EF", forHTTPHeaderField: "api_key")
    request.addValue("Armonik1001", forHTTPHeaderField: "app_id")
    request.addValue("admin", forHTTPHeaderField: "token_source")
    request.addValue(strUserToken, forHTTPHeaderField: "person_token")
    
    let task = session.dataTask(with: request as URLRequest) { data, response, error in
        guard data != nil else {
            print("no data found: \(String(describing: error))")
            return
        }
        do {
            if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
                postCompleted(true, json)
            }
            else {
                let jsonStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)    // No error thrown, but not NSDictionary
                print("Error could not parse JSON: \(String(describing: jsonStr))")
            }
        } catch let parseError {
            print(parseError)                                                          // Log the error thrown by `JSONObjectWithData`
            let jsonStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("Error could not parse JSON: '\(String(describing: jsonStr))'")
        }
    }
    task.resume()
}
