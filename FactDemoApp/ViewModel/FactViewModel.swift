//
//  FactViewModel.swift
//  FactDemoApp
//
//  Created by RAVITEZ on 18/06/21.
//

import UIKit

class FactViewModel: NSObject {
    private var apiService : APIService!
        private(set) var factData : Fact! {
            didSet {
                self.bindFactViewModelToController()
            }
        }
        var bindFactViewModelToController : (() -> ()) = {}
        
        override init() {
            super.init()
            self.apiService =  APIService()
            callFuncToGetFactData()
        }
        func callFuncToGetFactData() {
            self.apiService.apiToGetFactData { (factData) in
                self.factData = factData
            }
        }
    func getListOfFactRows() ->Array<FactRows> {
       return self.factData.rows!
   }
    func getFactTitle() ->String {
       return self.factData.title!
   }
}
