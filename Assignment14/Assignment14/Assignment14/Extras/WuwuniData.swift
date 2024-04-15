//
//  WuwuniData.swift
//  Assignment14
//
//  Created by Akaki Titberidze on 15.04.24.
//

import UIKit

class WuwuniData{
    var wuwunis = [
        Wuwuni(image: UIImage(named: "iconYellow")!, primaryText: "სილაბუსი", descriptionText: "შეიქმნას სილაბუსი", creationDate: Date.now, status: .Declined),
        Wuwuni(image: UIImage(named: "iconYellow")!, primaryText: "სილაბუსის ატვირთვა", descriptionText: "აიტვირთოს სილაბუსი", creationDate: Date.now, status: .Late),
        Wuwuni(image: UIImage(named: "iconRed")!, primaryText: "Beka ras gverchi", descriptionText: "ახლა გავხსენი დავალება ეს რააარიიი", creationDate: Date.init(timeIntervalSince1970: 30000), status: .Started),
        Wuwuni(image: UIImage(named: "iconBlue")!, primaryText: "რამე სიმღერა მირჩიეთ", descriptionText: "დავალების კეთებისას ღამე ძაან მეძინება, ყავამ არ მიშველა", creationDate: Date.now, status: .Postponed),
        Wuwuni(image: UIImage(named: "iconGreen")!, primaryText: "ფიგმამ თქვენც დაგტანჯათ?", descriptionText: "შევწუხდი დაბალი ხარისხით იწერს ყველას", creationDate: Date.now, status: .Planning),
        Wuwuni(image: UIImage(named: "iconBlue")!, primaryText: "მეტი ბედინა გვინდა", descriptionText: "შევწუხდით ნუ, აღარ გვინდა ამდენი ტეილორ Swift-ი", creationDate: Date.now, status: .Finished),
    ]
}


