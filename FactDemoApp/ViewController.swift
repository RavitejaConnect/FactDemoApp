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
            self.factTabView.reloadDetails(FactRows:self.factViewModel.getListOfFactRows(),title : self.factViewModel.getFactTitle())
        }
}

