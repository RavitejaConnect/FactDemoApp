//
//  ViewController.swift
//  FactDemoApp
//
//  Created by RAVITEZ on 18/06/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var factTabView: tabMainView!
    private var factViewModel : FactViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        callToViewModelForUIUpdate()
    }
    func callToViewModelForUIUpdate(){
            
            self.factViewModel =  FactViewModel()
            self.factViewModel.bindFactViewModelToController = {
                self.updateDataSource()
            }
        }
    func updateDataSource(){
            
//            self.dataSource = EmployeeTableViewDataSource(cellIdentifier: "FactCell", items: self.factViewModel.factData.data, configureCell: { (cell, evm) in
//                cell.employeeIdLabel.text = evm.id
//                cell.employeeNameLabel.text = evm.employeeName
//            })
        
        
        DispatchQueue.main.async {
            self.factTabView.reloadDetails(FactRows: self.factViewModel.getListOfFactRows(),title : self.factViewModel.getFactTitle())
        }
            
//            DispatchQueue.main.async {
////                self.employeeTableView.dataSource = self.dataSource
//                self.factTabView.tabularView.reloadData()
//            }
        }


}

