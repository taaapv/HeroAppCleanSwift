//
//  HeroTableViewCell.swift
//  HeroAppCleanSwift
//
//  Created by Татьяна on 16.01.2023.
//

import UIKit

protocol CellModelRepresentable {
    var viewModel: CellIdentifiable? { get set }
}

class HeroTableViewCell: UITableViewCell, CellModelRepresentable {
    
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var heroImageView: UIImageView! {
        didSet {
            heroImageView.layer.cornerRadius = 30
        }
    }
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: CellIdentifiable? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let viewModel = viewModel as? HeroCellViewModel else { return }
        heroNameLabel.text = viewModel.name
        
        let imageUrl = viewModel.imageUrl
        heroImageView.image = nil
            
            ImageManager.shared.fetchImage(with: imageUrl) { [unowned self] result in
                switch result {
                case .success(let imageData):
                    if viewModel.compareImages(with: imageUrl) {
                        self.activityIndicator.stopAnimating()
                        self.heroImageView.image = UIImage(data: imageData)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    
}
