import UIKit

protocol PTableViewCellAnyModel {
    var rowHeight: CGFloat { get }
    static var cellAnyType: UITableViewCell.Type { get }
    func configureAny(cell: UITableViewCell)
}

protocol PTableViewCellModel: PTableViewCellAnyModel {
    associatedtype CellType: UITableViewCell
    func configure(cell: CellType)
}

extension PTableViewCellModel {
    static var cellAnyType: UITableViewCell.Type {
        return CellType.self
    }
    
    func configureAny(cell: UITableViewCell) {
        if let cell = cell as? CellType {
            configure(cell: cell)
        } else {
            assertionFailure("Wrong usage")
        }
    }
    
    var rowHeight: CGFloat {
        return UITableView.automaticDimension
    }
}
