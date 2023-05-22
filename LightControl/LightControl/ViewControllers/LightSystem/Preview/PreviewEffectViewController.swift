//
//  PreviewEffectViewController.swift
//  LightControl
//
//  Created by imac-2626 on 2023/5/20.
//

import UIKit

class PreviewEffectViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var firstLightImageView: UIImageView!
    @IBOutlet weak var secondLightImageView: UIImageView!
    @IBOutlet weak var thirdLightImageView: UIImageView!
    @IBOutlet weak var fourthLightImageView: UIImageView!
    @IBOutlet weak var fifthLightImageView: UIImageView!
    @IBOutlet weak var sixthLightImageView: UIImageView!
    @IBOutlet weak var seventhLightImageView: UIImageView!
    @IBOutlet weak var eighthLightImageView: UIImageView!
    @IBOutlet weak var ninethLightImageView: UIImageView!
    @IBOutlet weak var runButton: UIButton!
    
    // MARK: - Variables
    
    var lightTry = true
    
    var previewLightCode: [String] = []
    var previewTime: [Double] = []
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - UI Settings
    
    func setupUI() {
        setupButton()
        setupImageView()
    }
    
    private func setupButton() {
        runButton.backgroundColor = .systemBlue
        runButton.setTitle("預覽", for: .normal)
        runButton.setTitleColor(.white, for: .normal)
        runButton.layer.cornerRadius = runButton.frame.height / 6
    }
    
    private func setupImageView() {
        firstLightImageView.image = UIImage(systemName: "lightbulb")
        secondLightImageView.image = UIImage(systemName: "lightbulb")
        thirdLightImageView.image = UIImage(systemName: "lightbulb")
        fourthLightImageView.image = UIImage(systemName: "lightbulb")
        fifthLightImageView.image = UIImage(systemName: "lightbulb")
        sixthLightImageView.image = UIImage(systemName: "lightbulb")
        seventhLightImageView.image = UIImage(systemName: "lightbulb")
        eighthLightImageView.image = UIImage(systemName: "lightbulb")
        ninethLightImageView.image = UIImage(systemName: "lightbulb")
    }
    
    // MARK: - Function
    
    func timeControl(lightCode: [String], times: [Double]) {
        var light = 0
        
//        times.forEach { time in
//            DispatchQueue.main.asyncAfter(deadline: .now() + time) {
//                print(lightCode[light])
//                self.lightControl(light: lightCode[light])
//                light += 1
//            }
//        }
        
        for time in times {
            Thread.sleep(forTimeInterval: time)
            print(lightCode[light])
            lightControl(light: lightCode[light])
            light += 1
        }
    }
    
    func lightControl(light: String) {
        let lights = Array(light)
        for component in lights {
            if component == "1" {
                firstLightImageView.image = UIImage(systemName: "lightbulb.fill")
            }
            if component == "2" {
                secondLightImageView.image = UIImage(systemName: "lightbulb.fill")
            }
            if component == "3" {
                thirdLightImageView.image = UIImage(systemName: "lightbulb.fill")
            }
            if component == "4" {
                fourthLightImageView.image = UIImage(systemName: "lightbulb.fill")
            }
            if component == "5" {
                fifthLightImageView.image = UIImage(systemName: "lightbulb.fill")
            }
            if component == "6" {
                sixthLightImageView.image = UIImage(systemName: "lightbulb.fill")
            }
            if component == "7" {
                seventhLightImageView.image = UIImage(systemName: "lightbulb.fill")
            }
            if component == "8" {
                eighthLightImageView.image = UIImage(systemName: "lightbulb.fill")
            }
            if component == "9" {
                ninethLightImageView.image = UIImage(systemName: "lightbulb.fill")
            }
        }
    }
    
    // MARK: - IBAction
    
    @IBAction func runEffect(_ sender: Any) {
//        print(previewLightCode, previewTime)
        timeControl(lightCode: previewLightCode, times: previewTime)
    }
}
