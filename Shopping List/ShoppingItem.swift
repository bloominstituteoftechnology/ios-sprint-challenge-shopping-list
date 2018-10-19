import UIKit

class ShoppingItem: UIView {





required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    let _ = loadViewFromNib()
}

    func loadViewFromNib() -> UIView {
        let bundle = Bundle.init(for: type(of: self))
        let nib = UINib(nibName: "ShoppingItem", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil) [0] as! UIView
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth , UIViewAutoresizing.flexibleHeight]
            addSubview(view)
            return view
    }



}
