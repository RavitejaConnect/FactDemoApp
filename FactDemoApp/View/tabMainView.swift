//
//  tabMainView.swift
//  JsonparserDemoApp
//
//  Created by RAVITEZ on 17/06/21.
//

import UIKit

class tabMainView: UIView {

    @IBOutlet weak var tabularView: UITableView!
    @IBOutlet weak var view: UIView!
    var rows : [FactRows]! = []
    @IBOutlet weak var title: UILabel!
    
    // MARK: - Constants
    let imageCache = NSCache<NSString, AnyObject>()
    // MARK: - Properties
    var imageURLString: String?
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        nibSetup()

    }
    
    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super .init(coder: coder)
        nibSetup()
    }
    
    
    private func nibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        addSubview(view)
        tabularView.register(UINib(nibName: "FactCell", bundle: Bundle.main), forCellReuseIdentifier: "FactCell")
        tabularView.delegate = self
        tabularView.dataSource = self
        tabularView.rowHeight = UITableView.automaticDimension
        tabularView.estimatedRowHeight = 250
        
    }
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return nibView
    }
    
    func reloadDetails(FactRows :[FactRows],title : String)  {
        rows=FactRows
        DispatchQueue.main.async {
            self.title.text = title
            self.tabularView .reloadData()
        }
    }
}
extension String {
    func replace(string:String, replacement:String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
    }

    func removeWhitespace() -> String {
        return self.replace(string: " ", replacement: "")
    }
  }

extension tabMainView :UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FactCell", for: indexPath) as! FactCell
        cell.selectionStyle = .none
        let cellData = rows[indexPath.row]
        cell.titleLabel.text=cellData.title ?? "NA";
        cell.descLabel.text=cellData.description ?? "NA";
        let imageUrlStr = cellData.imageHref ?? ""
        cell.imageViewObj .downloadImageFrom(urlString: imageUrlStr, imageMode:.scaleAspectFit)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150;
    }
   
    
}


extension UIImageView {
    func downloadImageFrom(urlString: String, imageMode: UIView.ContentMode) {
            guard let url = URL(string: urlString) else { return }
            downloadImageFrom(url: url, imageMode: imageMode)
        }

    func downloadImageFrom(url: URL, imageMode: UIView.ContentMode) {
            contentMode = imageMode
        let imageCache = NSCache<NSString, AnyObject>()
            if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) as? UIImage {
                self.image = cachedImage
            } else {
                URLSession.shared.dataTask(with: url) { data, response, error in
                    guard let data = data, error == nil else { return }
                    DispatchQueue.main.async {
                        let imageToCache = UIImage(data: data)
                        guard let imageToCache1  = imageToCache else { return }
                        imageCache.setObject(imageToCache1, forKey: url.absoluteString as NSString)
                        self.image = imageToCache
                    }
                }.resume()
            }
        }
}
