
import UIKit
import Foundation



class FeedbackViewController: UIViewController, UIViewControllerTransitioningDelegate {
    

    
    var actInd : UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 0,y: 0, width: 50, height: 50)) as UIActivityIndicatorView
    
    @IBOutlet var feedbackInput: UITextField!

    required init(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)!
        self.modalPresentationStyle = UIModalPresentationStyle.custom
        self.transitioningDelegate = self
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedbackInput.becomeFirstResponder()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func cancelFeedback(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeModal(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
            }
    
    func loadData() {
        //UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        //showSpinner()
    }
    
    func showSpinner() {
        actInd.center = self.view.center
        actInd.hidesWhenStopped = true
        actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(actInd)
        actInd.startAnimating()
    }
    
    func hideSpinner() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        actInd.stopAnimating()
    }
    
    @IBAction func sendFeedback(_ sender: UIButton) {

        let headers = [
            "content-type": "application/json",
            "cache-control": "no-cache"
        ]
        let parameters = [
            "user": "Ram Vennam",
            "feedback": feedbackInput.text!
            ] as [String : Any]
        
        let postData = try!JSONSerialization.data(withJSONObject: parameters, options: [])
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://feedbackmanager.mybluemix.net/submitFeedback")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse as Any)
            }
        })
        
        dataTask.resume()
        self.dismiss(animated: true, completion: nil)
    }
    
}

