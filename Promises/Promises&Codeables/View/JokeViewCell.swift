//
//  JokeViewCell.swift
//  Promises&Codeables
//
//  Created by Sushant on 7/19/18.
//  Copyright © 2018 Sushant. All rights reserved.
//

import UIKit

class JokeViewCell: UITableViewCell {

    @IBOutlet weak var jokeView : UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    var joke : Jokes? {
        didSet {
            guard let jokesInfo = joke else { return }
            self.configureCell(joke: jokesInfo)
        }
    }
    
    func configureCell(joke : Jokes) {
        self.jokeView.text = joke.joke
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}


extension UITextView {
    
    func centerText() {
        self.textAlignment = .center
        let fittingSize = CGSize(width: bounds.width, height: CGFloat.greatestFiniteMagnitude)
        let size = sizeThatFits(fittingSize)
        let topOffset = (bounds.size.height - size.height * zoomScale) / 2
        let positiveTopOffset = max(1, topOffset)
        contentOffset.y = -positiveTopOffset
    }
}
