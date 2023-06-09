//
//  HomeVC.swift
//  KSI-Task
//
//  Created by eslam dweeb on 09/06/2023.
//

import UIKit

class HomeVC: BaseWireFrame<HomeVCViewModel> {

    @IBOutlet weak var productColl: UICollectionView!
    @IBOutlet weak var productCountLbl: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindCollectionView()
        viewModel.viewDidLoad()
    }
   
    //MARK: - setup UI
    
    private func setupUI(){
        searchTextField.setPlaceHolderColor(.DarkGray,Fonts.regular(name: FontName.Montserrat.rawValue, size: FontSize.fontMedium))
        productColl.backgroundColor = .white
        productColl.registerCell(cellClass: ProductCell.self)
        productColl.setCollectionViewLayout(UICollectionViewCompositionalLayout(section: productSectionLayout()), animated: true)
    }
    fileprivate func productSectionLayout()->NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
         let item = NSCollectionLayoutItem(layoutSize: itemSize)
         
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(215))
         let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item,item])
       
         let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 15
         return section
    }
    //MARK: - Bind
    override func bind(viewModel: HomeVCViewModel) {
        viewModel.isLoading.subscribe {[weak self] loading in
            guard let self else{return}
            guard let isLoading = loading.element else{return}
            if isLoading{
                self.showIndicator(withTitle: "", and: "")
            }else{
                self.hideIndicator()
            }
        }.disposed(by: disposeBag)
        
        viewModel.hasErrInTxt.subscribe {[weak self] msg in
            guard let self,let msg = msg.element else{return}
            if msg != "" {
                self.createAlert(erroMessage: msg)
            }
        }.disposed(by: disposeBag)
    }
    func bindCollectionView(){
        viewModel.productItems.asObservable().bind(to: productColl.rx.items(cellIdentifier: ProductCell.getIdentifier(),cellType: ProductCell.self)){[weak self] index,model,cell in
            guard let self else{return}
            cell.configurationCeLl(name: model.name, description: model.description, price: self.viewModel.getForrmstedNumWithCurrency(num: model.price), imageUrl: model.thumbnail)
        }.disposed(by: disposeBag)
    }
}

