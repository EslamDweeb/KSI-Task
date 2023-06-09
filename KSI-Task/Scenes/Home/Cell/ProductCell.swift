//
//  ProductCell.swift
//  KSI-Task
//
//  Created by eslam dweeb on 09/06/2023.
//

import UIKit
import Kingfisher

protocol ProductCellViewModel{
    func configurationCeLl(name:String,description:String,price:String,imageUrl:String)
}
class ProductCell: UICollectionViewCell,ProductCellViewModel {
    
    @IBOutlet weak var ProductPriceLbl: UILabel!
    @IBOutlet weak var productDescLbl: UILabel!
    @IBOutlet weak var ProductNameLbl: UILabel!
    @IBOutlet weak var faveBtn: UIButton!
    @IBOutlet weak var productImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.borderColor = .Gray6
        contentView.borderWidth = 2
        contentView.cornerRadius = 15
        faveBtn.tintColor = .black
    }
    func configurationCeLl(name:String,description:String,price:String,imageUrl:String){
        ProductNameLbl.text  = name
        productDescLbl.text = description
        ProductPriceLbl.text = price
        productImageView.kf.setImage(with: URL(string: imageUrl))
    }
}
