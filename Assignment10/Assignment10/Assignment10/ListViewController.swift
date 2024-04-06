//
//  ListViewController.swift
//  Assignment10
//
//  Created by Akaki Titberidze on 06.04.24.
//
import UIKit

class ListViewController: UIViewController {

    

    @IBOutlet weak var espressoName: UIButton!
    @IBOutlet weak var espressoStars: UILabel!

    @IBOutlet weak var flatWhiteName: UIButton!
    @IBOutlet weak var flatWhiteStars: UILabel!

    @IBOutlet weak var machName: UIButton!
    @IBOutlet weak var machStars: UILabel!

    @IBOutlet weak var lungoName: UIButton!
    @IBOutlet weak var lungoStars: UILabel!
    
    @IBOutlet weak var imageOutlet: UIImageView!
    
    var espresso: Coffee?
    var flatWhite: Coffee?
    var macchiato: Coffee?
    var lungo: Coffee?
    
    static var selectedCoffee: Coffee?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCoffees()
        assignCoffeesToContainers()
        imageOutlet.layer.cornerRadius = 20
        imageOutlet.clipsToBounds = true
    }
    
    @IBAction func espressoClicked(_ sender: UIButton) {
        ListViewController.selectedCoffee = espresso
    }
    
    @IBAction func flawWhiteClicked(_ sender: UIButton) {
        ListViewController.selectedCoffee = flatWhite
    }
    
    @IBAction func macchiatoClicked(_ sender: UIButton) {
        ListViewController.selectedCoffee = macchiato
    }
    
    @IBAction func lungoClicked(_ sender: UIButton) {
        ListViewController.selectedCoffee = lungo
    }
    
    func initializeCoffees(){
        espresso = Coffee(image: UIImage(named: "espresso"), name: "ესპრესო", secondName: "შოკოლადით", star: 4.8, ratings: 240, isFavorite: false, description: "მოცემული კაპუჩინო არის დაახლოებით 150 მლ. ის შეიცავს 25 მლ. ესპრესოს ყავას, 85 მლ. ახალთახალი მოწველილი ძროხის რძის რძეს. ", smallPrice: 3.52, mediumPrice: 4.53, bigPrice: 5.54)
        flatWhite = Coffee(image: UIImage(named: "flatWhite"), name: "ბრტყელი თეთრი", secondName: "რძიანი", star: 4.2, ratings: 101, isFavorite: true, description: "ნამდვილი მამაკაცების სასმელი, 1-1ზე კოფე ცხელ ყავასთან და მაგრად მორეული შაქრით, კაია კაროჩე", smallPrice: 3.32, mediumPrice: 4.12, bigPrice: 5.42)
        macchiato = Coffee(image: UIImage(named: "macchiato"), name: "მაკიატო", secondName: "ანადღვები რძით", star: 3.8, ratings: 51, isFavorite: true, description: "ეს იგივეა რაც ბრტყელი თეთრი მარა ნაკლები რძით და ადღვებილია თან ესპრესო იგივე დოზით", smallPrice: 3.82, mediumPrice: 4.99, bigPrice: 5.99)
        lungo = Coffee(image: UIImage(named: "lungo"), name: "ლუნგო", secondName: "მეტი წყლით", star: 3.2, ratings: 13, isFavorite: false, description: "ამის დამზადებისას ცოტა ყავა გვქონდა იდეაში და რა დავამატოთო და ავდექით ისევ წყალი დავამატეთ", smallPrice: 1.32, mediumPrice: 2.12, bigPrice: 3.42)
    }
    
    func assignCoffeesToContainers(){
        espressoName.setTitle(espresso?.name, for: .normal)
        espressoStars.text = String(espresso!.star)

        flatWhiteName.setTitle(flatWhite?.name, for: .normal)
        flatWhiteStars.text = String(flatWhite!.star)

        machName.setTitle(macchiato?.name, for: .normal)
        machStars.text = String(macchiato!.star)

        lungoName.setTitle(lungo?.name, for: .normal)
        lungoStars.text = String(lungo!.star)
        
    }
}


struct Coffee {
    var image: UIImage?
    var name: String
    var secondName: String
    var star: Double
    var ratings: Int
    var isFavorite: Bool
    var description: String
    var smallPrice: Double
    var mediumPrice: Double
    var bigPrice: Double
}

