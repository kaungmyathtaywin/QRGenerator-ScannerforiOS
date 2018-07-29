//
//  QRGeneratorController.swift
//  QRCodeReader
//
//  Created by kaungmyathtaywin on 7/26/18.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import UIKit

class QRGeneratorController: UIViewController {

    @IBOutlet weak var dataField: UITextField!
    @IBOutlet weak var displayCodeView: UIImageView!
    
    var filter : CIFilter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataField.placeholder = "Type Your Code Here!"
        dataField.textAlignment = .center
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func generatePressed(_ sender: UIButton) {
        
        if let text = dataField.text {
            
            let data = text.data(using: .ascii, allowLossyConversion: false)
            
            filter = CIFilter(name: "CIQRCodeGenerator")
            filter.setValue(data, forKey: "inputMessage")
            
            let transform = CGAffineTransform(scaleX: 15, y: 15)
            let image = UIImage(ciImage: filter.outputImage!.transformed(by: transform))
            
            displayCodeView.image = image
            
        }
        
    }
    

}
