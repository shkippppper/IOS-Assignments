//
//  ViewController.swift
//  Assignment13
//
//  Created by Akaki Titberidze on 12.04.24.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Variables
    var students = [StudentInformation]()
    var studentsDictionary = [Character: [StudentInformation]]()
    var sectionTitles = [String]()
    var selfData: StudentInformation?
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.register(SelfCustomCell.self, forCellReuseIdentifier: "SelfCustomCell")
        return tableView
    }()
    
    // MARK: Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupUI()
    }
    
    func setupData(){
        students = StudentData().students
        if let selfIndex = students.firstIndex(where: { $0.fullName.contains("akaki titberidze") }) {
            selfData = students[selfIndex]
        }
        students.removeAll { $0.fullName.contains("akaki titberidze") }
        students.sort(by: { ($0.fullName < $1.fullName) }) // sort students by their full name
        organizeStudentsByFirstLetter()
        
        navigationItem.title = "iOS Squad"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func setupUI(){
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
        ])
    }
    
    func getFirstLettersArray() -> [Character]{
        var charArray = [Character]()
        students.forEach({ student in
            if !charArray.contains(student.fullName.capitalized.first!) {
                charArray.append(student.fullName.capitalized.first!)
            }
        })
        return charArray
    }
    
    func organizeStudentsByFirstLetter() {
        studentsDictionary = [:]
        students.forEach { student in
            let firstLetter = student.fullName.capitalized.first!
            if studentsDictionary[firstLetter] == nil {
                studentsDictionary[firstLetter] = []
            }
            studentsDictionary[firstLetter]?.append(student)
        }
        sectionTitles = studentsDictionary.keys.map { String($0) }.sorted()
    }
}
// MARK: TableView
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            let sectionKey = sectionTitles[section - 1].first!
            return studentsDictionary[sectionKey]?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelfCustomCell", for: indexPath) as! SelfCustomCell
            cell.configure(with: selfData!.profileImage, and: selfData!.fullName.capitalized + " - \(selfData!.randomEmoji)")
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            let sectionKey = sectionTitles[indexPath.section - 1].first!
            if let student = studentsDictionary[sectionKey]?[indexPath.row] {
                cell.textLabel?.text = student.fullName.capitalized + " - \(student.randomEmoji)"
            }
            cell.accessoryType = .disclosureIndicator
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return nil
        } else {
            return sectionTitles[section - 1]
        }
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        sectionTitles
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let infoVC = InfoViewController()
        if indexPath.section == 0{
            infoVC.student = selfData
        }else{
            let sectionKey = sectionTitles[indexPath.section - 1].first! //get section char
            if let student = studentsDictionary[sectionKey]?[indexPath.row]{
                infoVC.student = student
            }
        }
        
        navigationController?.pushViewController(infoVC, animated: true)
    }
}

#Preview {
    ViewController()
}
