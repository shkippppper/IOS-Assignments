import Foundation

//თქვენი დავალებაა კარგათ გაერკვეთ როგორ მუშაობს ARC სხვადასხვა იმპლემენტაციების გამოყენებით.


//6.გატესტეთ მიღებული შედეგები ინსტანსების შექმნით და დაპრინტვით

//1.შექმენით ციკლური რეფერენცები და გაწყვიტეთ
class Human {
    var name: String
    var laptop: Laptop?
    
    init(name: String, laptop: Laptop? = nil) {
        self.name = name
        self.laptop = laptop
        print("\(name) Initialized")
    }
    
    deinit {
        print("\(name) Deinitialized")
    }
}

class Laptop {
    var name: String
    weak var human: Human?
    
    init(name: String, human: Human? = nil) {
        self.name = name
        self.human = human
        print("\(name) Initialized")
    }
    
    deinit {
        print("\(name) Deinitialized")
    }
}

var akaki: Human? = Human(name: "Akaki")
var macBook: Laptop? = Laptop(name: "MacBook Pro")

akaki?.laptop = macBook
macBook?.human = akaki

akaki = nil
macBook = nil

//2.აუცილებელია ქლოჟერების გამოყენება

class Assignment {
    var completion: (() -> Void)?
    
    func complete() {
        completion?()
    }
    
    init(completion: (() -> Void)? = nil) {
        self.completion = completion
        print("Assignment initialized")
    }
    
    deinit {
        print("Assignment deinitialized")
    }
}

var assignment: Assignment? = Assignment()
assignment?.completion = {
    print("assignment complete")
}

assignment?.complete()
assignment = nil

//3.აუცილებელია value და რეფერენს ტიების გამოყენება (კლასები, სტრუქტურები, ენამები და პროტოკოლები)

struct TestResult {
    var name: String
    var score: Int
}

var studentResult = TestResult(name: "Akaki", score: 100)
var studentResult1 = studentResult

studentResult1.name = "Gocha"
studentResult1.score = 90

print(studentResult)
print(studentResult1)

// რადგანაც studentResult struct-ია მისი სხვა ვერიაბლში გადაწერით არ იქმნება reference. შესაბამისად ამ სხვა ვერიაბლზე მონაცემების ცვლილება არ გამოიწვევს ორიგინალის შეცვლას

enum Tetrominos { // ტეტრისის ერთ ბლოკს ქვია ასე
    case L
    case T
    case I
    case S
}

var currentTetromino = Tetrominos.L
var newTetromino = currentTetromino

newTetromino = .T
print(currentTetromino)
print(newTetromino)

// ანალოგიურად მოხდება enum-ზეც, სხვა ვერიაბლის ცვლილება (რომელიც თავიდან ორიგინალს გავუტოლეთ), არ შეცვლის ორიგინალს.

protocol GameSetting {
    func gameStarted()
}

class Game {
    var gameScene: GameScene
    
    init(gameScene: GameScene) {
        self.gameScene = gameScene
    }
    deinit{
       print("Game Deinitialized")
    }
}

class GameScene: GameSetting{
    func gameStarted() {
        print("Game started")
    }
    deinit{
        print("Gamescene Deinitialized")
    }
}

var gameScene: GameScene? = GameScene()
var game: Game? = Game(gameScene: gameScene!)
game!.gameScene.gameStarted()
gameScene = nil
game = nil

//4.აუცილებელია გამოიყენოთ strong, weak & unowned რეფერენსები ერთხელ მაინც

//---Strong Reference---//

class Strong {
    var strongReference: StrongReference?
    init(strongReference: StrongReference? = nil) {
        self.strongReference = strongReference
        print("Strong Initialized")
    }
    deinit { print("Strong Deinitialized") }
}

class StrongReference {
    var strong: Strong?
    init(strong: Strong? = nil) {
        self.strong = strong
        print("StrongReference Initialized")
    }
    deinit { print("StrongReference Deinitialized") }
}

var strong: Strong? = Strong()
var strongReference: StrongReference? = StrongReference()

strong?.strongReference = strongReference
strongReference?.strong = strong

strong = nil
strongReference = nil

//---Weak Reference---//

class Weak {
    var weakReference: WeakReference?
    init(weakReference: WeakReference? = nil) {
        self.weakReference = weakReference
        print("Weak Initialized")
    }
    deinit { print("Weak Deinitialized") }
}

class WeakReference {
    weak var weak: Weak?
    init(weak: Weak? = nil) {
        self.weak = weak
        print("WeakReference Initialized")
    }
    deinit { print("WeakReference Deinitialized") }
}

var weak: Weak? = Weak()
var weakReference: WeakReference? = WeakReference()

weak?.weakReference = weakReference
weakReference?.weak = weak

weak = nil
weakReference = nil

//---Unowned Reference---//

class Unowned {
    var unownedReference: UnownedReference?
    init(unownedReference: UnownedReference? = nil) {
        self.unownedReference = unownedReference
        print("Unowned Initialized")
    }
    deinit { print("Unowned Deinitialized") }
}

class UnownedReference {
    unowned var unowned: Unowned
    init(unowned: Unowned) {
        self.unowned = unowned
        print("UnownedReference Initialized")
    }
    deinit { print("UnownedReference Deinitialized") }
}

var unowned1: Unowned? = Unowned()
var unownedReference: UnownedReference? = UnownedReference(unowned: unowned1!)

unowned1?.unownedReference = unownedReference

unowned1 = nil
unownedReference = nil


//5.დაიჭირეთ self ქლოჟერებში

class Player {
    var name: String
    var scoreUpdater: (() -> Void)?
    
    init(name: String, scoreUpdater: (() -> Void)? = nil) {
        self.name = name
        self.scoreUpdater = scoreUpdater
        print("\(self.name) initialized")
    }
    
    func score() {
        scoreUpdater = { [weak self] in
            guard let self = self else {return}
            print("\(self.name) scored")
        }
    }
    
    deinit {
        print("\(self.name) deinitialized")
    }
}

var player: Player? = Player(name: "Akaki")
player?.score()
player?.scoreUpdater?()
player = nil
