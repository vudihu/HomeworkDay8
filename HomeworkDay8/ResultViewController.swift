//
//  ResultViewController.swift
//  HomeworkDay8
//
//  Created by Hung Vu on 19/10/2023.
//

import UIKit

final class ResultViewController: UIViewController {
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var numberBMILabel: UILabel!
    @IBOutlet private weak var detailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func setupUI() {
        
    }

    @IBAction private func backToCalculate(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let calculateView = mainStoryboard.instantiateViewController(withIdentifier: "BMIViewControllerID") as! BMIViewController
        calculateView.modalPresentationStyle = .overFullScreen
        self.present(calculateView, animated: false)
    }
}
