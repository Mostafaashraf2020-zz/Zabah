
import UIKit
import Alamofire
import SDWebImage

class TermofusesViewController: UIViewController {

    @IBOutlet weak var imageTerm: UIImageView!
    @IBOutlet weak var texttwo_term: UILabel!
    @IBOutlet weak var term1: UILabel!
    var termData : (TermModel)?
    override func viewDidLoad() {
        super.viewDidLoad()
        getTerms()

       
    }
    func getTerms()  {
        let url = "https://zabeeeha.000webhostapp.com/public/api/termsofuse"
        Alamofire.request(url, method:.get, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .responseJSON{ respones in
                do {
                    let decoder = JSONDecoder()
                    let termData =  try decoder.decode(TermModel.self, from: respones.data!)
                    self.termData = termData
                   
                    if termData.stat == 200
                    {
                        print("good")
                        self.term1.text =   termData.terms_of_use?.text_2
                        self.texttwo_term.text = termData.terms_of_use?.text_1
                        self.imageTerm.sd_setImage(with: URL(string:  ((termData.terms_of_use?.img)!)), placeholderImage: UIImage(contentsOfFile: "a"), options: .handleCookies, completed: nil)
                        
                        
                        
                    }
                    else
                    {
                        print("erorr")
                    }
                } catch let error
                {
                    print(error.localizedDescription)
                    
                }
        }
    }
    


}
