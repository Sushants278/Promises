//
//  ViewController.swift
//  Promises&Codeables
//
//  Created by 1042834 on 7/18/18.
//  Copyright © 2018 1042834. All rights reserved.
//

import UIKit
import PromiseKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        RequestManager.shared().getJokes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

