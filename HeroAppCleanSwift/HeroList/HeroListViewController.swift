//
//  HeroListViewController.swift
//  HeroAppCleanSwift
//
//  Created by Татьяна on 16.01.2023.
//

import UIKit

protocol HeroListDisplayLogic: AnyObject {
    func displayHeroes(viewModel: HeroList.ShowHeros.ViewModel)
}

class HeroListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var interactor: HeroListBusinessLogic?
    
    private var rows: [CellIdentifiable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HeroListConfigurator.shared.configure(with: self)
        getHeroes()
    }
    
    private func getHeroes() {
        interactor?.fetchHeroes()
    }
}

extension HeroListViewController: HeroListDisplayLogic {
    func displayHeroes(viewModel: HeroList.ShowHeros.ViewModel) {
        rows = viewModel.rows
        DispatchQueue.main.async { [unowned self] in
            self.tableView.reloadData()
        }
    }
}

extension HeroListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = rows[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.cellIdentifier, for: indexPath) as? HeroTableViewCell else { return UITableViewCell() }
        cell.viewModel = cellViewModel
        return cell
    }
}

extension HeroListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        rows[indexPath.row].cellHeight
    }
}
