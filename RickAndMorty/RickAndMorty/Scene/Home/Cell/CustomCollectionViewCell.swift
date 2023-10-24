//
//  CustomCollectionViewCell.swift
//  RickAndMorty
//
//  Created by muhammed fatih elçi on 3.08.2023.
//

import UIKit
import AlamofireImage
import SnapKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    private lazy var rickName: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .black
        addSubview(label)
        return label
    }()
    
    private lazy var status: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .center
        addSubview(label)
        return label
    }()
    
    private lazy var specise: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .black
        label.textAlignment = .center
        addSubview(label)
        return label
    }()
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        //image.backgroundColor = .white
        contentView.addSubview(image)
        return image
    }()
    

    enum Identifier: String {
        case path = "Cell"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        makeImage()
        makeName()
        makeStatus()
        makeSpecise()
    }
    
    func saveModel(value: Result){
        image.af.setImage(withURL: URL(string: value.image)!)
        rickName.text = "Name: \(value.name)"
        status.text = "Status: \(value.status)"
        specise.text = "Specise: \(value.species)"
        
        switch value.status {
        case .alive:
            contentView.backgroundColor = .systemGreen
        case .dead:
            contentView.backgroundColor = .systemCyan
        case .unknown:
            contentView.backgroundColor = .systemPink
        }
    }
}

extension CustomCollectionViewCell {
    private func makeImage() {
        image.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(5)
            make.centerX.equalTo(contentView.snp.centerX)
            make.width.equalTo(contentView.snp.width).multipliedBy(1/1.2)
        }
    }
    private func makeName() {
        rickName.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(5)
            make.centerX.equalTo(contentView.snp.centerX)
        }
    }
    private func makeStatus() {
        status.snp.makeConstraints { make in
            make.top.equalTo(rickName.snp.bottom).offset(5)
            make.centerX.equalTo(contentView.snp.centerX)
        }
    }
    private func makeSpecise() {
        specise.snp.makeConstraints { make in
            make.top.equalTo(status.snp.bottom).offset(5)
            make.centerX.equalTo(contentView.snp.centerX)
        }
    }
    
}
