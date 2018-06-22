//
//  SelectModuleViewController.swift
//  ClassKit Research
//


import UIKit

final class SelectModuleViewController: TypedViewController<SelectModuleView>, UITableViewDelegate, UITableViewDataSource, ModuleQuizViewControllerDelegate {
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = modules[indexPath.row]
        model.start()
        let moduleQuizViewController = ModuleQuizViewController(module: model, viewMaker: ModuleQuizView())
        moduleQuizViewController.delegate = self
        present(moduleQuizViewController, animated: true)
    }
    
    func moduleQuizViewController(_ viewController: ModuleQuizViewController, didFinishModule module: Module) {
        module.finish()
        presentAlertWithScore(fromModule: module)
    }
    
    private func presentAlertWithScore(fromModule module: Module) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .percent
        let percentageScore = numberFormatter.string(from: NSNumber(value: module.calculateScore())) ?? "0 %"
        let message = "You've scored \(percentageScore)"
        let alertController = UIAlertController(title: "Results", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }
}
