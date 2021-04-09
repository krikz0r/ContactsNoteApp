import UIKit
var studentList = [StudentModel]()
class TableView : UITableViewController {
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let studentCell = tableView.dequeueReusableCell(withIdentifier: "studentCellId", for: indexPath) as! StudentCell
        let thisStudent: StudentModel!
        thisStudent = studentList[indexPath.row]
        studentCell.oldUserNameTF.text = thisStudent.userName
        studentCell.oldUserMarkTF.text = thisStudent.userMark
        return studentCell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentList.count
    }
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}
