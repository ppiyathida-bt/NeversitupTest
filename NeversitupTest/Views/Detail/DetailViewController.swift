//
//  DetailViewController.swift
//  NeversitupTest
//
//  Created by Piyathida Buathad on 15/5/2567 BE.
//

import UIKit

class DetailViewController: UIViewController {
    
    public class func instantiateFromStoryboard() -> DetailViewController {
        let storyboard = UIStoryboard(name: "Detail", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! DetailViewController
    }
    
    @IBOutlet var bgView: UIView! {
        didSet {
            self.bgView.setBorderAndRadius()
        }
    }
    
    @IBOutlet  var descriptionTextView: UITextView!
    
    var product: Product!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData()
    }
    
    func setupData() {
        self.descriptionTextView.text = product.desc
        self.descriptionTextView.sizeToFit()
    }
    
    @IBAction func closeAction() {
        self.dismiss(animated: false)
    }
    
}
