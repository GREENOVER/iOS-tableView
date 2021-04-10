import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(withIdentifier: "cell") as? SampleTableViewCell else {
            return UITableViewCell()
        }
        
        if indexPath.section <= 4 {
            cell.sectionLabel.isHidden = false
            cell.sectionLabel.text = "(\(indexPath.section), \(indexPath.row))"
        } else {
            cell.sectionLabel.isHidden = true
        }
        
        if indexPath.row == 3 {
            cell.backgroundColor = .systemRed
        } else {
            cell.backgroundColor = .white
        }
        
        switch indexPath.row {
            case 0:
                cell.sampleImageView.image = UIImage(named: "0")
            case 1:
                cell.sampleImageView.image = UIImage(named: "1")
            case 2:
                cell.sampleImageView.image = UIImage(named: "2")
            default:
                cell.sampleImageView.image = nil
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
    }
}
