//
//  AlertViewController.swift
//  defaultProject
//
//  Created by Yoojin Park on 2021/01/26.
//

import UIKit

class AlertViewController: UIViewController {
    enum AlertStyle {
        case ok
        case okCancel
    }
    
    enum AlertActionStyle {
        case ok
        case cancel
    }
    
    @IBOutlet private weak var shadowView: UIView!
    @IBOutlet private weak var messageView: UIView!
    @IBOutlet private weak var messageLabel: UILabel!
    
    @IBOutlet private weak var cancelButton: UIButton!
    @IBOutlet private weak var okButton: UIButton!
    
    private var message: String = ""
    private var okTitle: String = "확인"
    private var cancelTitle: String = "취소"
    private var okAction: (() -> Void)?
    private var cancelAction: (() -> Void)?
    
    private var alertStyle: AlertStyle = .ok
    
    init(message: String) {
        self.message = message
        
        super.init(nibName: "TDNAAlertViewController", bundle: nil)
        
        self.modalPresentationStyle = .overFullScreen
        self.modalTransitionStyle = .crossDissolve
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func present(_ parent: UIViewController) {
        parent.present(self, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shadowView.setShadow(color: (0, 0, 0), alpha: 0.2, x: 0, y: 10, blur: 30, spread: 0)
        messageView.setCornerRadius(radius: 16)
        cancelButton.isHidden = alertStyle == .ok
    }
    
    func addAction(style: AlertActionStyle, title: String?, action: (() -> Void)?) {
        switch style {
        case .ok:
            okTitle = title ?? "확인"
            okAction = action
        case .cancel:
            cancelTitle = title ?? "취소"
            cancelAction = action
            alertStyle = .okCancel
        }
    }
    
    @IBAction func okButtonAction(_ sender: Any) {
        self.dismiss(animated: true) {
            self.okAction?()
        }
    }

    @IBAction func cancelButtonAction(_ sender: Any) {
        self.dismiss(animated: true) {
            self.cancelAction?()
        }
    }
}
