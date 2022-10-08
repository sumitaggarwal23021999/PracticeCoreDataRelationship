
import UIKit

class CollegeListVC: UIViewController {

    @IBOutlet weak var tblvwCollegeList: UITableView!
    var arrCollegeList: [College] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tblvwCollegeList.delegate = self
        tblvwCollegeList.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        arrCollegeList = DatabaseHelper.sharedObject.getcollegeList()
        tblvwCollegeList.reloadData()
    }

    @IBAction func btnAddcollege(_ sender: UIBarButtonItem) {
        let addCollegeVC = storyboard?.instantiateViewController(withIdentifier: "AddCollegeVC") as! AddCollegeVC
        navigationController?.pushViewController(addCollegeVC, animated: true)
    }
    
}

extension CollegeListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrCollegeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollegeListingTVC", for: indexPath) as! CollegeListingTVC
        cell.college = arrCollegeList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrCollegeList = DatabaseHelper.sharedObject.deleteCollege(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Student", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "StudentListVC") as! StudentListVC
        vc.college = arrCollegeList[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

