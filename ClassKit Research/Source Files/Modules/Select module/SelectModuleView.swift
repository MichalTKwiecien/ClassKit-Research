//
//  SelectModuleView.swift
//  ClassKit Research
//


import UIKit

final class SelectModuleView: View, ViewSetupable {
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.register(cell: UITableViewCell.self)
        return view.layoutable()
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Select module"
        view.font = .systemFont(ofSize: 24)
        view.textAlignment = .center
        return view.layoutable()
    }()

    func setupViewHierarchy() {
        [titleLabel, tableView].forEach(addSubview)
    }
    
    func setupConstraints() {
        titleLabel.constraintToSuperviewEdges(excludingAnchors: [.bottom])
        tableView.constraintToSuperviewEdges(excludingAnchors: [.top])
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 80),
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor)
        ])
    }
    
    func setupProperties() {
        backgroundColor = .white
    }
}
