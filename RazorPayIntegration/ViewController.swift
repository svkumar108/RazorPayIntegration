//
//  ViewController.swift
//  RazorPayIntegration
//
//  Created by sivakumar on 23/11/18.
//  Copyright © 2018 sivakumar. All rights reserved.
//

import UIKit
import Razorpay


// to implement razorpay we need 1.API_KEY 2.AMOUNT IN PAISA 3.COCOAPOD(razorpay)

class ViewController: UIViewController, RazorpayPaymentCompletionProtocol {
    
    var razorpay:Razorpay!
    let API_KEY = "rzp_test_1DP5mmOlF5G5ag"
   
    
    
    @IBOutlet weak var paidLabel: UILabel!
    
    @IBOutlet weak var paymentFailedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        razorpay = Razorpay.initWithKey(API_KEY, andDelegate: self)
    }
    
    
    func onPaymentError(_ code: Int32, description str: String) {
        
        paymentFailedLabel.isHidden = false
        paidLabel.isHidden = true
        
    }
    
    func onPaymentSuccess(_ payment_id: String) {
        
        paymentFailedLabel.isHidden = true
        paidLabel.isHidden = false
    }
    
    
    

    @IBAction func payNowPressed(_ sender: UIButton) {
        paymentShowForm()
        
    }
    
    func paymentShowForm(){
        
        let params:[String:Any] = [
        
            //"id": "pay_29QQoUBi66xm2f",
            "image": "https://www.programmableweb.com/sites/default/files/styles/facebook_scale_height_200/public/razorpay.png?itok=L_v31l-h",
            //"entity": "payment",
            "amount": 5000,
           // "currency": "INR",
          //  "status": "captured",
          //  "method": "card",
            "description": "Payment for adidas shoes",
            "name": "siva kumar",
           // "amount_refunded": 0,
            //"refund_status": null,
           // "notes": {},
           // "fee": 1145,
           // "tax": 145,
           // "error_code": null,
           // "error_description": null,
           // "created_at": 1400826750,
            "theme": [
                "color": "#F37254"
            
            ],
            "prefill": [
                "email": "test@razorpay.com",
                "contact": "7075387734"]
         
        ]
        
        razorpay.open(params)
    }
    
}

