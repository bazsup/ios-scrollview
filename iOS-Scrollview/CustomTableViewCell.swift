//
//  CustomTableViewCell.swift
//  iOS-Scrollview
//
//  Created by Supawit Ruen on 18/12/2563 BE.
//

import UIKit

protocol CustomTableViewCellDelegate: class {
    func sendSelectedAnimal(_ animal: Animal)
 }

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    static let identifier = "CustomTableViewCell"
    
    var selectedAnimal: Animal? = nil
    weak var delegate: CustomTableViewCellDelegate? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func onClickReadmore(_ sender: Any) {
        guard let animal = selectedAnimal else {
            return
        }
        delegate?.sendSelectedAnimal(animal)
    }
}
