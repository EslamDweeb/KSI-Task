//
//  HomeVCViewModel.swift
//  KSI-Task
//
//  Created by eslam dweeb on 09/06/2023.
//

import Foundation
import RxSwift
import RxCocoa

protocol HomeVCViewModelOutput{
    var productItems:BehaviorRelay<[Product]>{get set}
    var productCount:BehaviorRelay<String>{get set}
    func viewDidLoad()
    func getForrmstedNumWithCurrency(num:Int)-> String
}
protocol HomeVCViewModelInput{
   
}
class HomeVCViewModel:ViewModel,HomeVCViewModelInput,HomeVCViewModelOutput {
    var hasErrInTxt: PublishSubject<String> = .init()
    var isLoading: BehaviorRelay<Bool> = .init(value:false)
    var productItems:BehaviorRelay<[Product]> = .init(value: [])
    var productCount:BehaviorRelay<String> = .init(value: "0 products found")
    private var getProductListUsecase:GetProductListUsecase
    
    init(getProductListUsecase: GetProductListUsecase) {
        self.getProductListUsecase = getProductListUsecase
    }
    func viewDidLoad() {
        getProductItems()
    }
    private func getProductItems(){
        isLoading.accept(true)
        getProductListUsecase.excute {[weak self] success, error in
            guard let self else{return}
            self.isLoading.accept(false)
            if let success {
                self.productItems.accept(success.products)
                self.productCount.accept("\(success.total) Product found")
            }
            if let error {
                self.hasErrInTxt.onNext(error)
            }
        }
    }
    func getForrmstedNumWithCurrency(num:Int)-> String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current // replace with desired locale if needed
        return formatter.string(from: NSNumber(value: num)) ?? ""
    }
}
