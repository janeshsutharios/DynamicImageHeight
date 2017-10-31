# Dynamic image height for ios Swift 3 & 4 
DynamicImageHeight is simple light weight for setting up dynamically image height

<p align="center"><img src="https://im3.ezgif.com/tmp/ezgif-3-925fe4874e.gif" width="242" height="425"/></p>

## Features

- You can use either with static image or with URL using SDWebImage.
```
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
```

