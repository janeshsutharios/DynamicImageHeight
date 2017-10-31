import UIKit
import SDWebImage
class ViewController: UIViewController {
    @IBOutlet weak var tableViewHome :UITableView!
    override func viewDidLoad() {
        tableViewHome.register(UINib(nibName:"HomeTableViewCell",bundle:nil), forCellReuseIdentifier: "cell")
        tableViewHome.estimatedRowHeight = 400
        tableViewHome.rowHeight = UITableViewAutomaticDimension
    }
}
// MARK: TableView datasource delegate
extension ViewController :UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 17
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! HomeTableViewCell
        cell.selectionStyle = .none
        let image = UIImage(named:"\(indexPath.row+1)")
        cell.feedImageView.image = image

        var cellFrame = cell.frame.size
        cellFrame.height =  cellFrame.height - 15
        cellFrame.width =  cellFrame.width - 15
        cell.feedImageHeightConstraint.constant = self.getAspectRatioAccordingToiPhones(cellImageFrame: cellFrame,downloadedImage: image!)


//        let url = URL(string: feedModel[indexPath.row].imageModel[0].standardResolutionUrl!)
//        cell.feedImageView.sd_setImage(with: url, placeholderImage: nil, options: [], completed: { (theImage, error, cache, url) in
//            cell.feedImageHeightConstraint.constant = self.getAspectRatioAccordingToiPhones(cellImageFrame: cellFrame,downloadedImage: theImage!)
//
//        })
        return cell
    }
    func getAspectRatioAccordingToiPhones(cellImageFrame:CGSize,downloadedImage: UIImage)->CGFloat {
        let widthOffset = downloadedImage.size.width - cellImageFrame.width
        let widthOffsetPercentage = (widthOffset*100)/downloadedImage.size.width
        let heightOffset = (widthOffsetPercentage * downloadedImage.size.height)/100
        let effectiveHeight = downloadedImage.size.height - heightOffset
        return(effectiveHeight)
    }
    // MARK: Optional function for resize of image
    func resizeHighImage(image:UIImage)->UIImage {
        let size = image.size.applying(CGAffineTransform(scaleX: 0.5, y: 0.5))
        let hasAlpha = false
        let scale: CGFloat = 0.0 // Automatically use scale factor of main screen
        UIGraphicsBeginImageContextWithOptions(size, !hasAlpha, scale)
        image.draw(in: CGRect(origin: .zero, size: size))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return scaledImage!

    }
}



