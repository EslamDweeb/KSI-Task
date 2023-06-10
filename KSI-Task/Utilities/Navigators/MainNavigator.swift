//
//  MainNavigator.swift
//  Leedo
//
//  Created by eslam dweeb on 21/09/2022.
//

import UIKit


class MainNavigator:Navigator{
    var coordinator: Coordinator
    
    enum Destination {
        case home
        case menu
        case favourite
        case cart
        case profile
        case productDetails(id:String)
    }
    
    required init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    func viewController(for destination: Destination) -> UIViewController {
        switch destination{
        case .home:
            let viewModel = HomeVCViewModel(getProductListUsecase: DefaultGetProductListUsecase(homeRepo: DefaultHomeRepo(productListLDBCLient: ProductListLDBCLient.shared)),productItemFavUsecase: DefaultProductItemFavUsecase(homeRepo: DefaultHomeRepo(productListLDBCLient: ProductListLDBCLient.shared)))
            return HomeVC(viewModel: viewModel, coordinator: coordinator)
        case .menu:
            let viewModel = MenuVCViewModel()
            return MenuVC(viewModel: viewModel, coordinator: coordinator)
        case .favourite:
            let viewModel = FavouriteVCViewModel()
            return FavouriteVC(viewModel: viewModel, coordinator: coordinator)
        case .cart:
            let viewModel = CartVCViewModel()
            return CartVC(viewModel: viewModel, coordinator: coordinator)
        case .productDetails(let id):
            let viewModel = ProductDetailsVCVieModel(id: id,repo: DefaultProductDetailsRepo(productListLDBCLient: ProductListLDBCLient.shared))
            return ProductDetailsVC(viewModel: viewModel, coordinator: coordinator)
        case .profile:
            let viewModel = ProfileVCViewModel()
            return ProfileVC(viewModel: viewModel, coordinator: coordinator)
        default:
           return UIViewController()
        }
    }
}
