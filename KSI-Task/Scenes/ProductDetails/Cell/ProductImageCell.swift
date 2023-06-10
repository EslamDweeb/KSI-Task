//
//  ProductImageCell.swift
//  KSI-Task
//
//  Created by eslam dweeb on 09/06/2023.
//

import UIKit
import Kingfisher

protocol ProductImageCellViewModel{
    func ConfigureCell(imageUrl:String)
}
class ProductImageCell: UICollectionViewCell,ProductImageCellViewModel {

    @IBOutlet weak var productImageView: UIImageView!
    override var isSelected: Bool {
        willSet {
            onSelected(newValue)
        }
    }
    func onSelected(_ newValue: Bool) {
        self.borderColor = newValue ? .black : .Gray2
        self.productImageView.borderColor = newValue ? .black : .Gray2
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        productImageView.borderWidth = 1
    }
    
    func ConfigureCell(imageUrl:String){
        productImageView.kf.setImage(with: URL(string: imageUrl))
    }
}
