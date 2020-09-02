//
//  lottieViewController.swift
//  noticeApp
//
//  Created by Miguel Eduardo  Valdez Tellez  on 02/09/20.
//  Copyright © 2020 Miguel Eduardo  Valdez Tellez . All rights reserved.
//

import UIKit
import Lottie
class lottieViewController: UIViewController {
    @IBOutlet weak var lottieView: AnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let animation: Animation? = Animation.named("facebookAni")
        lottieView.animation = animation
        lottieView.animationSpeed = 3
        lottieView.play{
            result in
            let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let controller = storyBoard.instantiateViewController(withIdentifier: "nave")
            controller.modalPresentationStyle = .fullScreen
            self.present(controller, animated: true)
        }
    }
}
