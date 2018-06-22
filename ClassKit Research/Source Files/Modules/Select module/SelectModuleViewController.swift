//
//  SelectModuleViewController.swift
//  ClassKit Research
//


import UIKit

final class SelectModuleViewController: TypedViewController<SelectModuleView>, UITableViewDelegate, UITableViewDataSource {

    private let modules: [Module]
    
    init(modules: [Module], viewMaker: @autoclosure @escaping () -> View) {
        self.modules = modules
        super.init(viewMaker: viewMaker() as! SelectModuleView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.tableView.dataSource = self
        customView.tableView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedRow = customView.tableView.indexPathForSelectedRow {
            customView.tableView.deselectRow(at: selectedRow, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modules.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: UITableViewCell = tableView.dequeueReusableCell(for: indexPath) else {
            return UITableViewCell()
        }
        let model = modules[indexPath.row]
        cell.textLabel?.text = model.title
        return cell
    }
}
