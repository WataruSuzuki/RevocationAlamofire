//
//  FirstViewController.swift
//  RevocationAlamofire
//
//  Created by WataruSuzuki on 2016/11/30.
//  Copyright © 2016年 WataruSuzuki. All rights reserved.
//

import UIKit
import Alamofire

class FirstViewController: UIViewController {

    let urlStr = "https://revoked.badssl.com"
//    let urlStr = "https://badssl.com"
    
    let myTrustPolicies: [String: ServerTrustPolicy] = [
        "revoked.badssl.com": ServerTrustPolicy.performRevokedEvaluation(validateHost: true, revocationFlags: kSecRevocationRequirePositiveResponse)
    ]
    var myAfManager: SessionManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        checkRevocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func checkRevocation() {
        myAfManager = SessionManager(
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: myTrustPolicies)
        )
        
        myAfManager.request(urlStr).response { (response) in
            print(response)
        }
    }
}

