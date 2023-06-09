//
//  MenuVCViewModel.swift
//  KSI-Task
//
//  Created by eslam dweeb on 09/06/2023.
//

import Foundation
import RxSwift
import RxCocoa

class MenuVCViewModel:ViewModel {
    var hasErrInTxt: PublishSubject<String> = .init()
    var isLoading: BehaviorRelay<Bool> = .init(value:false)
}

