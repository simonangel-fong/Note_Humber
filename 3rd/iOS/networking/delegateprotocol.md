# iOS - Delegate Protocol

[Back](#ios---delegate-protocol)

- [iOS - Delegate Protocol](#ios---delegate-protocol)
  - [Example](#example)

---

## Example

- `APIManager`

```swift
//
//  APIManager.swift
//  networking_delegateProtocol
//
//  Created by Simon Fong on 09/12/2023.
//

import Foundation
import UIKit


protocol APIDelegate{
    func requestSuccess(data:Data)
    func requestError(error:Error?)
}


enum APIError: Error {
    case invalidString(String)
}

class APIManager{

    var delegate : APIDelegate?
    static var shared: APIManager = APIManager()

    func fetchData(urlStr: String){

        do{
            let urlObj = URL(string: urlStr)
            let task = URLSession.shared.dataTask(with: urlObj!) { data, response, error in

                // if error
                if let errorObj = error {
                    print("error")
                    self.delegate?.requestError(error: errorObj)
                    return
                }

                if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode){
                    self.delegate?.requestError(error: APIError.invalidString("Status code:\(httpResponse.statusCode)") )
                    return
                }

                if let goodData = data{
                    print("goodData")
                    self.delegate?.requestSuccess(data: goodData)
                }
            }
            task.resume()
        }
    }
}

```

---

- `AppModel`

```swift
//
//  AppModel.swift
//  networking_delegateProtocol
//
//  Created by Simon Fong on 09/12/2023.
//

import Foundation
import UIKit

class DataModel:Codable{
    var collection: collectionObj?
}

class collectionObj:Codable{
    var metadata: metadataObj?
}

class metadataObj:Codable{
    var total_hits: Int
}

class AppModel{

    /// Function to decode Json into target type
    func decodeJson(data:Data)-> DataModel{
        return try! JSONDecoder().decode(DataModel.self, from: data)
    }
    /// Function to convert data into UIImage
    func toImage(data:Data)-> UIImage?{
        return UIImage(data:data)
    }
}

```

---

- `ViewController`

```swift
//
//  ViewController.swift
//  networking_delegateProtocol
//
//  Created by Simon Fong on 09/12/2023.
//

import UIKit

class ViewController: UIViewController, APIDelegate {

    let appModel = (UIApplication.shared.delegate as! AppDelegate).appModel

    @IBOutlet weak var imageV: UIImageView!

    @IBOutlet weak var totalLbl: UILabel!

    let url_image = "http://mars.nasa.gov/mer/gallery/all/2/f/001/2F126468064EDN0000P1001R0M1-BR.JPG"

    let url_json = "https://images-api.nasa.gov/search?q=moon&page_size=10"


    override func viewDidLoad() {
        super.viewDidLoad()
        APIManager.shared.delegate=self
//        APIManager.shared.fetchData(urlStr: url_json)       // get json
        APIManager.shared.fetchData(urlStr: url_image)      // get image
    }

    func requestError(error: Error?) {
        print("requestError")
        DispatchQueue.main.async {
            self.showErrorAlert(errorStr: error!.localizedDescription)
        }
    }

    func requestSuccess(data: Data) {
//        let jsonData = appModel.decodeJson(data: data)
//        DispatchQueue.main.async {
//            self.totalLbl.text = jsonData.collection!.metadata!.total_hits.description
//        }

        let image = appModel.toImage(data: data)
        DispatchQueue.main.async {
            self.imageV.image = image
        }
    }

    func showErrorAlert(errorStr:String){
        // create the alert
        let alert = UIAlertController(
            title: "Error",
            message: errorStr,
            preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: UIAlertAction.Style.default,
                handler: nil)
        )
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}
```

---

[TOP](#ios---delegate-protocol)
