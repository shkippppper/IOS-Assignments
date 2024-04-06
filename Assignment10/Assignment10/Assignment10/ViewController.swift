//
//  ViewController.swift
//  Assignment10
//
//  Created by Akaki Titberidze on 05.04.24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buyButtonOutlet: UIButton!
    @IBOutlet weak var footerOutlet: UIStackView!
    @IBOutlet weak var smallBtnOutlet: UIButton!
    @IBOutlet weak var mediumBtnOutlet: UIButton!
    @IBOutlet weak var bigBtnOutlet: UIButton!
    
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productSecondName: UILabel!
    @IBOutlet weak var productStars: UILabel!
    @IBOutlet weak var productReviews: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productFavorite: UIButton!
    
    var customBrownColor: UIColor = UIColor(red: 198/255, green: 124/255, blue: 77/255, alpha: 1) //vici ro es asetebshi unda iyos mara ver davumugame imas :d da es metodi nacadimaq
    var customLightBrownColor: UIColor = UIColor(red: 1, green: 245/255, blue: 238/255, alpha: 1)


    var product: Coffee?
    
    var priceSelectedId: Int = 2 // 1-small, 2-medium, 3-big
    var isProductFavorite: Bool = false
    var productWasFavoriteInitially: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponentStyles()
        product = ListViewController.selectedCoffee
        
        if let product = product {
                setupComponentsWithData()
            }
        
    }


    
    @IBAction func smallCoffee(_ sender: UIButton) {
        priceSelectedId = 1
        productPrice.text = "₾ \(String(product!.smallPrice))"
        fixPriceContainersStyles()
    }
    
    
    @IBAction func mediumCoffee(_ sender: UIButton) {
        priceSelectedId = 2
        productPrice.text = "₾ \(String(product!.mediumPrice))"
        fixPriceContainersStyles()
    }
    
    @IBAction func bigCoffee(_ sender: Any) {
        priceSelectedId = 3
        productPrice.text = "₾ \(String(product!.bigPrice))"
        fixPriceContainersStyles()
    }
    
    @IBAction func heartButtonClicked(_ sender: UIButton) {
        isProductFavorite.toggle()
        
        if isProductFavorite {
            productFavorite.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            productFavorite.tintColor = .red
            productReviews.text = productWasFavoriteInitially! ? "(\(String(product!.ratings)))" : "(\(String(product!.ratings + 1)))"
        } else {
            productFavorite.setImage(UIImage(systemName: "heart"), for: .normal)
            productFavorite.tintColor = .systemGray
            productReviews.text = productWasFavoriteInitially! ? "(\(String(product!.ratings - 1)))" : "(\(String(product!.ratings)))"
        }
    }
    
    func setupComponentStyles(){
        buyButtonOutlet.layer.cornerRadius = 20
        buyButtonOutlet.layer.borderWidth = 1
        buyButtonOutlet.layer.borderColor = customBrownColor.cgColor
        buyButtonOutlet.clipsToBounds = true
        
        footerOutlet.layer.cornerRadius = 20
        footerOutlet.layer.shadowColor = UIColor.black.cgColor
        footerOutlet.layer.shadowOpacity = 0.3
        footerOutlet.layer.shadowOffset = .zero
        footerOutlet.layer.shadowRadius = 20
        footerOutlet.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        smallBtnOutlet.layer.cornerRadius = 15
        smallBtnOutlet.layer.borderWidth = 1
        smallBtnOutlet.layer.borderColor = UIColor.lightGray.cgColor
        
        mediumBtnOutlet.layer.cornerRadius = 15
        mediumBtnOutlet.layer.borderWidth = 1
        mediumBtnOutlet.layer.borderColor = customBrownColor.cgColor
        mediumBtnOutlet.layer.backgroundColor = customLightBrownColor.cgColor
        mediumBtnOutlet.setTitleColor(customBrownColor, for: .normal)
        
        bigBtnOutlet.layer.cornerRadius = 15
        bigBtnOutlet.layer.borderWidth = 1
        bigBtnOutlet.layer.borderColor = UIColor.lightGray.cgColor
        
        productImage.layer.cornerRadius = 15
        productImage.clipsToBounds = true
    }
    
    func setupComponentsWithData(){
        productImage.image = product?.image
        productName.text = product?.name
        productSecondName.text = product?.secondName
        productStars.text = String(product!.star)
        productReviews.text = "(\(String(product!.ratings)))"
        productDescription.text = product?.description
        productPrice.text = "₾ \(String(product!.mediumPrice))"
        
        productWasFavoriteInitially = product!.isFavorite
        
        if product!.isFavorite{
            productFavorite.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            productFavorite.tintColor = .red
            isProductFavorite = true
        } else {
            productFavorite.setImage(UIImage(systemName: "heart"), for: .normal)
            isProductFavorite = false
        }
    }
    
    func fixPriceContainersStyles(){
        if priceSelectedId == 1 {
            smallBtnOutlet.layer.borderColor = customBrownColor.cgColor
            smallBtnOutlet.layer.backgroundColor = customLightBrownColor.cgColor
            smallBtnOutlet.setTitleColor(customBrownColor, for: .normal)
            
            mediumBtnOutlet.layer.backgroundColor = UIColor.white.cgColor
            mediumBtnOutlet.layer.borderColor = UIColor.lightGray.cgColor
            mediumBtnOutlet.setTitleColor(UIColor.black, for: .normal)
            
            bigBtnOutlet.layer.backgroundColor = UIColor.white.cgColor
            bigBtnOutlet.layer.borderColor = UIColor.lightGray.cgColor
            bigBtnOutlet.setTitleColor(UIColor.black, for: .normal)
        }else if priceSelectedId == 2 {
            smallBtnOutlet.layer.backgroundColor = UIColor.white.cgColor
            smallBtnOutlet.layer.borderColor = UIColor.lightGray.cgColor
            smallBtnOutlet.setTitleColor(UIColor.black, for: .normal)
            
            mediumBtnOutlet.layer.borderColor = customBrownColor.cgColor
            mediumBtnOutlet.layer.backgroundColor = customLightBrownColor.cgColor
            mediumBtnOutlet.setTitleColor(customBrownColor, for: .normal)
            
            bigBtnOutlet.layer.backgroundColor = UIColor.white.cgColor
            bigBtnOutlet.layer.borderColor = UIColor.lightGray.cgColor
            bigBtnOutlet.setTitleColor(UIColor.black, for: .normal)
            
        }else{
            smallBtnOutlet.layer.backgroundColor = UIColor.white.cgColor
            smallBtnOutlet.layer.borderColor = UIColor.lightGray.cgColor
            smallBtnOutlet.setTitleColor(UIColor.black, for: .normal)
            
            mediumBtnOutlet.layer.backgroundColor = UIColor.white.cgColor
            mediumBtnOutlet.layer.borderColor = UIColor.lightGray.cgColor
            mediumBtnOutlet.setTitleColor(UIColor.black, for: .normal)
            
            bigBtnOutlet.layer.borderColor = customBrownColor.cgColor
            bigBtnOutlet.layer.backgroundColor = customLightBrownColor.cgColor
            bigBtnOutlet.setTitleColor(customBrownColor, for: .normal)
        }
    }
}

