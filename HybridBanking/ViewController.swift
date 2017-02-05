//
//  ViewController.swift
//  HybridBanking
//

import UIKit
import BMSCore




class ViewController: UIViewController {

    @IBOutlet var feedbackInput: UITextField!
    var actInd : UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 0,y: 0, width: 50, height: 50)) as UIActivityIndicatorView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(self, selector: #selector(didBecomeActive), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)

        

        
    }
    
    func didBecomeActive(_ notification: Notification) {
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeModal(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
        
        let request = NSMutableURLRequest(url: URL(string: "https://loyaltyAdmin.mybluemix.net/submitFeedback")!)
        //let session = URLSession.shared
        request.httpMethod = "POST"
        
        let params = ["user":"iOS User", "feedback":feedbackInput.text!] as Dictionary<String, String>
        
        
        request.httpBody = try!JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        
//        let task = session.dataTask(with: request, completionHandler: {data, response, error -> Void in
//            if(error != nil) {
//                // If there is an error in the web request, print it to the console
//                print("Error sending feedback, status \(error!.localizedDescription)")
//            }
//            else {
//                print("succesfully sent feedback")
//            }
//        })
//        
//        task.resume()
    }
    
    func showSpinner() {
        actInd.center = self.view.center
        actInd.hidesWhenStopped = true
        actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(actInd)
        actInd.startAnimating()
    }

}

