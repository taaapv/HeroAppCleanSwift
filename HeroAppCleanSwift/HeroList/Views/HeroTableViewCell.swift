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
    
    private var imageUrl: String? {
        didSet {
            heroImageView.image = nil
            updateImage()
        }
    }
    
    private func updateViews() {
        guard let viewModel = viewModel as? HeroCellViewModel else { return }
        heroNameLabel.text = viewModel.name
        imageUrl = viewModel.imageUrl
    }
    
    private func updateImage() {
        guard let viewModel = viewModel as? HeroCellViewModel else { return }
        let imageUrl = viewModel.imageUrl
        
        getImage(from: imageUrl) { [unowned self] result in
            switch result {
            case .success(let image):
                if imageUrl == self.imageUrl {
                    self.activityIndicator.stopAnimating()
                    self.heroImageView.image = image
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getImage(from imageUrl: String, completion: @escaping(Result<UIImage, NetworkError>) -> Void) {
        // Get image from cache
        guard let url = URL(string: imageUrl) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        if let cachedImage = ImageCache.shared.object(forKey: url.lastPathComponent as NSString) {
            print("Image from cache: \(url.lastPathComponent)")
            completion(.success(cachedImage))
            return
        }
        
        // Download image from network
        ImageManager.shared.fetchImage(with: imageUrl) { result in
            switch result {
            case .success(let imageData):
                guard let image = UIImage(data: imageData) else { return }
                ImageCache.shared.setObject(image, forKey: url.lastPathComponent as NSString)
                print("Image from network: \(url.lastPathComponent)")
                completion(.success(image))
            case .failure:
                completion(.failure(.noData))
            }
        }
    }
}
