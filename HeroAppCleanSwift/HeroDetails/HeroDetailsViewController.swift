//
//  HeroDetailsViewController.swift
//  HeroAppCleanSwift
//
//  Created by Татьяна on 18.01.2023.
//

import UIKit

protocol HeroDetailsDisplayLogic: AnyObject {
    func displayHero(viewModel: HeroDetails.ShowDetails.ViewModel)
    func displayFavoriteStatus(viewModel: HeroDetails.SetFavoriteStatus.ViewModel)
    func displayAlert(viewModel: HeroDetails.AddAlert.ViewModel)
}

class HeroDetailsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heroImage: UIImageView! {
        didSet {
            heroImage.layer.cornerRadius = 20
        }
    }
    @IBOutlet weak var powerStatsLabel: UILabel!
    @IBOutlet weak var biographyLabel: UILabel!
    @IBOutlet weak var workLabel: UILabel!
    @IBOutlet weak var isFavoriteButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    var interactor: HeroDetailsBusinessLogic?
    var router: (NSObjectProtocol & HeroDetailsRoutingLogic & HeroDetailsDataPassing)?
    
    // Object Lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = 15
        passRequest()
    }
    
    @IBAction func favoriteButtonPressed() {
        interactor?.setFavoriteStatus()
    }
    
    @IBAction func saveButtonPressed() {
        interactor?.saveButtonTapped()
    }
    
    private func passRequest() {
        interactor?.provideHeroDetails()
    }
    
    private func setup() {
        let viewController = self
        let interactor = HeroDetailsInteractor()
        let presenter = HeroDetailsPresenter()
        let router = HeroDetailsRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}

extension HeroDetailsViewController: HeroDetailsDisplayLogic {
    func displayHero(viewModel: HeroDetails.ShowDetails.ViewModel) {
        nameLabel.text = viewModel.heroName
        powerStatsLabel.text = viewModel.powerStats
        biographyLabel.text = viewModel.biography
        workLabel.text = viewModel.work
        heroImage.image = UIImage(data: viewModel.imageData)
        isFavoriteButton.tintColor = viewModel.isFavorite ? .red : .gray
        saveButton.setTitle(viewModel.saveButtonTitle, for: .normal)
    }
    
    func displayFavoriteStatus(viewModel: HeroDetails.SetFavoriteStatus.ViewModel) {
        isFavoriteButton.tintColor = viewModel.isFavorite ? .red : .gray
    }
    
    func displayAlert(viewModel: HeroDetails.AddAlert.ViewModel) {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: viewModel.title,
                message: viewModel.message,
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
}
