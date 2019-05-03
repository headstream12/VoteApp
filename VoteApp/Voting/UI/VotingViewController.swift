//
//  VotingViewController.swift
//  VoteApp
//
//  Created by Ilya Glazunov on 5/3/19.
//  Copyright © 2019 Ilya Glazunov. All rights reserved.
//

import UIKit

final class VotingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var cellModels: [PTableViewCellAnyModel] = []
    private let presenter = VotingPresenter()
    var selectedVariantIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        presenter.loadInfo(onSuccess: { [unowned self] cellModels in
            self.cellModels = cellModels
            tableView.reloadData()
        }, onError: { error in
            print(error)
        })
    }
    
    private func setupViews() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(nibModels: [VotingHeaderCellModel.self, VotingVariantCellModel.self])
        tableView.hideEmptyRows()
    }
}

extension VotingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withModel: cellModels[indexPath.row], for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? VotingVariantCell else {
            return
        }
        
        if let selectedIndexPath = self.selectedVariantIndexPath {
            let prevSelectedCell = tableView.cellForRow(at: selectedIndexPath) as! VotingVariantCell
            prevSelectedCell.checkboxButton.isSelected = false
        }
        
        cell.checkboxButton.isSelected = true
        selectedVariantIndexPath = indexPath
    }
}
