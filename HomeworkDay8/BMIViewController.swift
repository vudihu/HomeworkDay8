//
//  BMIViewController.swift
//  HomeworkDay8
//
//  Created by Hung Vu on 18/10/2023.
//

import UIKit

final class BMIViewController: UIViewController {
    @IBOutlet private weak var maleView: UIView!
    @IBOutlet private weak var femaleView: UIView!
    @IBOutlet private weak var heightLabel: UILabel!
    @IBOutlet private weak var weigthLabel: UILabel!
    @IBOutlet private weak var agelabel: UILabel!
    @IBOutlet private weak var painWeightButton: UIButton!
    @IBOutlet private weak var plusWeightButton: UIButton!
    @IBOutlet private weak var painAgeButton: UIButton!
    @IBOutlet private weak var plusAgeButton: UIButton!
    @IBOutlet private weak var heightSlider: UISlider!
    @IBOutlet private weak var calculateButton: UIButton!
    @IBOutlet private weak var heightView: UIView!
    @IBOutlet private weak var weightView: UIView!
    @IBOutlet private weak var ageView: UIView!
    
    var countWeight: CGFloat = 10
    var countAge: CGFloat = 1
    let radius: CGFloat = 8
    var valueBMI: CGFloat = 0
    var countHeight: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
//        weigthLabel.text = String(countWeight)
//        agelabel.text = String(countAge)
//        heightLabel.text = String(countHeight)
        calculateButton.layer.cornerRadius = radius
        [maleView, femaleView, heightView, weightView, ageView].forEach {
            $0?.layer.cornerRadius = radius
        }
        heightSlider.minimumValue = 50
        heightSlider.maximumValue = 250
        heightSlider.value = 50
        heightSlider.addTarget(self, action: #selector(changeValueSlider), for: .valueChanged)
        
        let tapMale = UITapGestureRecognizer(target: self, action: #selector(tapToChoiceMale))
        maleView.addGestureRecognizer(tapMale)
        
        let tapFemale = UITapGestureRecognizer(target: self, action: #selector(tapToChoiceFemale))
        femaleView.addGestureRecognizer(tapFemale)
    }
    
    @objc func tapToChoiceMale(_ gesture: UITapGestureRecognizer) {
        maleView.backgroundColor = UIColor(red: 38/255, green: 37/255, blue: 60/255, alpha: 1)
        femaleView.backgroundColor = UIColor(red: 54/255, green: 54/255, blue: 68/255, alpha: 1)
        
    }
    
    @objc func tapToChoiceFemale(_ gesture: UITapGestureRecognizer) {
        femaleView.backgroundColor = UIColor(red: 38/255, green: 37/255, blue: 60/255, alpha: 1)
        maleView.backgroundColor = UIColor(red: 54/255, green: 54/255, blue: 68/255, alpha: 1)
    }
    
    @objc func changeValueSlider(_ sender: UISlider) {
        let value = Int(sender.value)
        heightLabel.text = String(value)
        
    }
    
    @IBAction func tapToPainWeight(_ sender: Any) {
        if countWeight > 10 {
            countWeight -= 1
            weigthLabel.text = String(format: "%.0f", countWeight)
        }
    }
    @IBAction func tapToPlusWeight(_ sender: Any) {
        if countWeight < 150 {
            countWeight += 1
            weigthLabel.text = String(format: "%.0f", countWeight)
        }
    }
    @IBAction func tapToPainAge(_ sender: Any) {
        if countAge > 1 {
            countAge -= 1
            agelabel.text = String(format: "%.0f", countAge)
        }
    }
    @IBAction func tapToPlusAge(_ sender: Any) {
        if countAge < 120 {
            countAge += 1
            agelabel.text = String(format: "%.0f", countAge)
        }
    }
    @IBAction func tapToCalculateBMI(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let resultView = mainStoryboard.instantiateViewController(withIdentifier: "ResultViewControllerID") as! ResultViewController
        resultView.modalPresentationStyle = .overFullScreen
        var numberBMI: Float = 0
        numberBMI = Float(countWeight / ((countHeight * countHeight) / 10000))
        resultView.receivedData = numberBMI
        self.present(resultView, animated: false)
    }
    
    //Keo tha tap Gesture
    @IBAction func tapToHeightView(_ sender: Any) {
        
        
    }
}
