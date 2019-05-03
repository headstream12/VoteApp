//
//  UITableView.swift
//  VoteApp
//
//  Created by Ilya Glazunov on 5/3/19.
//  Copyright © 2019 Ilya Glazunov. All rights reserved.
//

import UIKit

extension UITableView {
    
    func hideEmptyRows() {
        tableFooterView = UIView()
    }
    
    func hideSectionsSeparator() {
        separatorColor = backgroundColor
    }
    
    func removeTopInset() {
        contentInset = UIEdgeInsets(top: -20, left: 0, bottom: 0, right: 0)
    }
    
    func reload(reloadCompleted: @escaping () -> Void) {
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            reloadCompleted()
        }
        self.reloadData()
        self.layoutIfNeeded()
        CATransaction.commit()
    }
    
    func setAndLayoutTableHeaderView(header: UIView) {
        self.tableHeaderView = header
        header.setNeedsLayout()
        header.layoutIfNeeded()
        header.frame.size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        self.tableHeaderView = header
    }
    
    func removeTableHeaderViewWithAnimation() {
        beginUpdates()
        let newFrame = CGRect(x: 0, y: 0, width: 0, height: 0)
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.tableHeaderView?.frame = newFrame
            self?.tableHeaderView = nil
        }
        endUpdates()
    }
    
    func register(nibModels: [PTableViewCellAnyModel.Type]) {
        for model in nibModels {
            let identifier = String(describing: model.cellAnyType)
            let nib = UINib(nibName: identifier, bundle: nil)
            register(nib, forCellReuseIdentifier: identifier)
        }
    }
    
    func dequeueReusableCell(withModel model: PTableViewCellAnyModel, for indexPath: IndexPath) -> UITableViewCell {
        let identifier = String(describing: type(of: model).cellAnyType)
        let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        model.configureAny(cell: cell)
        return cell
    }
}
