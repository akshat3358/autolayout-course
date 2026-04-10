import UIKit

public class PaddingLabel: UILabel {
    public var contentInsets: UIEdgeInsets = UIEdgeInsets.zero
    
    override public func drawText(in rect: CGRect) {
        let insetRect = rect.insetBy(dx: contentInsets.left, dy: contentInsets.top)
//        let insetRect = rect.inset(by: contentInsets)
        super.drawText(in: insetRect)
    }
    
    override public var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.width += contentInsets.left + contentInsets.right
        contentSize.height += contentInsets.top + contentInsets.bottom
        return contentSize
    }
    public override func sizeToFit() {
        super.sizeToFit()
        self.frame.size.width += contentInsets.left + contentInsets.right
        self.frame.size.height += contentInsets.top + contentInsets.bottom
    }
}

