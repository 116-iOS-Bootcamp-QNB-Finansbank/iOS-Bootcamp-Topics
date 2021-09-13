//
//  DetailTableViewController.swift
//  BasicUIComponents
//
//  Created by Semih Emre ÜNLÜ on 12.09.2021.
//

import UIKit

class DetailTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: customCellIdentifier) // sadece class olsaydi implementasyonu boyle olacakti
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "CustomTableViewCell") // eger olusturdugum custom cell ayni zamanda da xib dosyasi iceriyorsa bu sekilde bir implementasyon yapacagiz
    }

    struct Person {
        var name: String
        let lastname: String
        let govermentNumber: Int
    }
    
    var people = [Person(name: "Semih", lastname: "Unlu", govermentNumber: 1),
                  Person(name: "Ahmet", lastname: "Yilmaz", govermentNumber: 2),
                  Person(name: "Mehmet", lastname: "Demir", govermentNumber: 3),
                  Person(name: "Mustafa", lastname: "Celik", govermentNumber: 4),
                  Person(name: "Ayse", lastname: "Kurt", govermentNumber: 5),
                  Person(name: "Fatma", lastname: "Caglar", govermentNumber: 6),
                  Person(name: "Burak", lastname: "Sarsilmaz", govermentNumber: 7),
                  Person(name: "Deniz", lastname: "Cetin", govermentNumber: 8),
                  Person(name: "Emre", lastname: "Yalcin", govermentNumber: 9),
                  Person(name: "Pelin", lastname: "Yazar", govermentNumber: 10),
                  Person(name: "Nejla", lastname: "Ozhan", govermentNumber: 11)]
    
//    var personNames: [String] {
//        people.map { (person) in person.name }
//    }

    var firstChars: [Character] {
        people.map { person in person.name.first ?? " "}
    }
    
    private var customCellIdentifier = "CustomTableViewCell"
}

extension DetailTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*
        print(people[indexPath.row].name)
        
        people.append(people[indexPath.row])
        tableView.reloadData()
         */
        
        switch indexPath.section {
        case 0:
            people[indexPath.row].name = people[indexPath.row].name + "*"
            tableView.reloadRows(at: [indexPath], with: .automatic)
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return CGFloat(75)
        case 1:
            return CGFloat(45)
        case 2:
            return CGFloat(100)
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return CGFloat(75)
        case 1:
            return CGFloat(45)
        case 2:
            return UITableView.automaticDimension
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "People"
        case 1:
            return "First chars of people names"
        default:
            return "Others"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(40)
    }
}

extension DetailTableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return people.count
        case 1:
            return firstChars.count
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
            cell.backgroundColor = UIColor.random
            let person = people[indexPath.row]
            cell.textLabel?.text = person.name
            cell.detailTextLabel?.text = person.lastname
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
            let char = firstChars[indexPath.row]
            cell.textLabel?.text = String(char)
            cell.detailTextLabel?.text = ""
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: customCellIdentifier,
                                                     for: indexPath) as! CustomTableViewCell
            cell.myLabel.text = "asfasdf asfg sdaf asdfg asf sdd as fgasd asdf as fg dfsszr gsd df sd ada fas fgsd sd fgdf fas fsd gsdaf fdhf sagdfh fgdfas as das sa das daf e gdr hdt gsdf sd gdht5d gdfg dh dfg "
            return cell
        default:
            return tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        }
    }
}
