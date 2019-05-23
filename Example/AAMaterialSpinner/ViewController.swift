//
//  ViewController.swift
//  AAMaterialSpinner
//
//  Created by EngrAhsanAli on 03/08/2019.
//  Copyright (c) 2019 EngrAhsanAli. All rights reserved.
//

import UIKit
import AAMaterialSpinner

class ViewController: UIViewController {
    
    var spinnerView: AAMaterialSpinner!

    @IBOutlet weak var loadingView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.aa_ms = self.loadingView.addMaterialSpinner()
        self.aa_ms.colorArray = [.blue, .red, .orange]
        self.aa_ms.circleLayer.lineWidth = 3.0
        
        // MASKED SPINNER VIEW
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        let spinner = AAMaterialSpinner.setMaskedSpinnerView(bgColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5), spinnerSize: 100)
        spinner.circleLayer.lineWidth = 3.0
        spinner.circleLayer.strokeColor = UIColor.cyan.cgColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func popup(_ sender: Any) {
        let vc = aa_vc_material_spinner(size: 100)
        vc.aa_ms.circleLayer.lineWidth = 2.0
        vc.aa_ms.circleLayer.strokeColor = UIColor.blue.cgColor
        aa_present_material_spinner()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.aa_dismiss_material_spinner()
        }
    }
    
    @IBAction func addToCurrentAction(_ sender: Any) {
        
        AAMaterialSpinner.showMaskedSpinner(self)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            AAMaterialSpinner.dismissMaskedSpinner()
        }
        
    }
    
    @IBAction func start(_ sender: Any) {
        self.aa_ms.beginRefreshing()
    }
    
    @IBAction func stop(_ sender: Any) {
        self.aa_ms.endRefreshing()

    }
}

