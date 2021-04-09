import UIKit
import CoreData


class DetailVC: UIViewController {

    @IBOutlet weak var newUserMarkTF: UITextField!
    @IBOutlet weak var newUserNameTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func saveButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "StudentModel", in: context)
        let newStudent = StudentModel(entity: entity!, insertInto: context)
        newStudent.id = studentList.count as NSNumber
        newStudent.userName = newUserNameTF.text
        newStudent.userMark = newUserMarkTF.text
        do{
           try  context.save()
            studentList.append(newStudent)
            navigationController?.popViewController(animated: true)
        }
        catch {
            
        }
    }
    
}

