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
    var viewModel: CellIdentifiable? {
        didSet {
            updateViews()
        }
    }

    private func updateViews() {
        guard let viewModel = viewModel as? HeroCellViewModel else { return }
        var content = defaultContentConfiguration()
        content.text = viewModel.name
        
        ImageManager.shared.fetchImage(with: viewModel.imageUrl) { [unowned self] result in
            switch result {
            case .success(let imageData):
                content.image = UIImage(data: imageData)
                self.contentConfiguration = content
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
