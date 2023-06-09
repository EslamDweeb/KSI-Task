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
    }
    
    override func bind(viewModel: HomeVCViewModel) {
        print("HomeVC")
    }
    
    //MARK: - setup UI
    
    private func setupUI(){
        searchTextField.setPlaceHolderColor(.DarkGray,Fonts.regular(name: FontName.Montserrat.rawValue, size: FontSize.fontMedium))
        productColl.backgroundColor = .white
        productColl.registerCell(cellClass: ProductCell.self)
        productColl.delegate = self
        productColl.dataSource = self
        productColl.setCollectionViewLayout(UICollectionViewCompositionalLayout(section: productSectionLayout()), animated: true)
    }
    fileprivate func productSectionLayout()->NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .estimated(200))
         let item = NSCollectionLayoutItem(layoutSize: itemSize)
         
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(200))
         let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item,item])
       
         let section = NSCollectionLayoutSection(group: group)
       // section.orthogonalScrollingBehavior = .continuous
       // section.interGroupSpacing = 15
         //section.contentInsets = .init(top: 20, leading: 20, bottom: 20, trailing: 20)
       
         return section
    }
}

extension HomeVC:UICollectionViewDelegate{
    
}
extension HomeVC:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.getIdentifier(), for: indexPath) as? ProductCell else{return UICollectionViewCell()}
        return cell
    }
    
    
}
