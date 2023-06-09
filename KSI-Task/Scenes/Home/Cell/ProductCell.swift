//
//  ProductCell.swift
//  KSI-Task
//
//  Created by eslam dweeb on 09/06/2023.
//

import UIKit

class ProductCell: UICollectionViewCell {

    @IBOutlet weak var ProductPriceLbl: UILabel!
    @IBOutlet weak var productDescLbl: UILabel!
    @IBOutlet weak var ProductNameLbl: UILabel!
    @IBOutlet weak var faveBtn: UIButton!
    @IBOutlet weak var productImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.borderColor = .Gray6
        contentView.borderWidth = 2
        faveBtn.tintColor = .black
    }

}
