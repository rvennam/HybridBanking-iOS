
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
    
}

