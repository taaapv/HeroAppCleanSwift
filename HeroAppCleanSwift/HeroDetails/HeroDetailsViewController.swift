//
//  HeroDetailsViewController.swift
//  HeroAppCleanSwift
//
//  Created by Татьяна on 18.01.2023.
//

import UIKit

protocol HeroDetailsDisplayLogic: AnyObject {
    func displayHero(viewModel: HeroDetails.ShowDetails.ViewModel)
}

class HeroDetailsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var powerStatsLabel: UILabel!
    @IBOutlet weak var biographyLabel: UILabel!
    @IBOutlet weak var workLabel: UILabel!
    
    var interactor: HeroDetailsBusinessLogic?
    var router: (NSObjectProtocol & HeroDetailsRoutingLogic & HeroDetailsDataPassing)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension HeroDetailsViewController: HeroDetailsDisplayLogic {
    func displayHero(viewModel: HeroDetails.ShowDetails.ViewModel) {
        
    }
}
