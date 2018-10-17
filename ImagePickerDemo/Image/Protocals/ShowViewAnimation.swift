//
//  ShowAnimations.swift
//  会找房
//
//  Created by huifenqi on 2018/10/11.
//  Copyright © 2018 会分期. All rights reserved.
//

import UIKit
//import RxCocoa
//import RxSwift

class ShowViewAnimation: UIView, UITextViewDelegate {
    
    /// 点击事件回调
    var callBack:(() -> Void)?

    var attributedText: NSMutableAttributedString = NSMutableAttributedString.init()

    static let share: ShowViewAnimation = ShowViewAnimation()
    var tipView:UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 8
        return v
    }()
    
    var titleLabel: UILabel = {
        let l: UILabel = UILabel()
//        l.font = HZFFont.PFMedium.fontSize(size: 14)
        l.text = "最多只能选择9张图片"
        return l
    }()
    
//    private lazy var tipsTextView: UITextView = {[unowned self] in
//        let t: UITextView = UITextView()
//        t.isEditable = false
//        t.delegate = self
//        t.linkTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor(red:0,green:145/255,blue:63/255,alpha:1)]
//        t.isEditable = false
//        t.textContainerInset = UIEdgeInsets.zero;
//        t.textContainer.lineFragmentPadding = 0;
//        t.textAlignment = .center
//        return t
//        }()
    
    var btn: UIButton = {
        let b = UIButton()
//        b.setTitleColor(UIColor.hzf.green, for: .normal)
        b.titleLabel?.font = UIFont.systemFont(ofSize: 14)
//        b.layer.cornerRadius = 17 * UIScreen.e_ratio_375
        b.layer.borderWidth = 1
//        b.layer.borderColor = UIColor.hzf.green.cgColor
        b.setTitle("知道了", for: .normal)
        return b
    }()
    
//    let dispos: DisposeBag = DisposeBag()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpUI() {
        self.backgroundColor = UIColor.black.withAlphaComponent(0.32)
        e_addSubviews([tipView])
        tipView.e_addSubviews([titleLabel, btn])
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(30 * UIScreen.e_ratio_375)
            make.centerX.equalToSuperview()
            
        }
        
        
        btn.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-20 * UIScreen.e_ratio_375)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 118 * UIScreen.e_ratio_375, height: 34 * UIScreen.e_ratio_375))

        }
        
        tipView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 311 * UIScreen.e_ratio_375, height: 124 * UIScreen.e_ratio_375))
        }
        
//        btn.rx.tap.subscribe(
//            onNext: {[weak self] in
//                guard let `self` = self else{
//                    return
//                }
//                self.hid()
//        }).disposed(by: dispos)

        
    }
    
    func show(inview: UIView) {
        inview.addSubview(self)
        self.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        ShowAnimations.share.show(show: true, view: self.tipView)
        ShowAnimations.share.call = {(stop, show) in
            if stop, !show {
                self.removeFromSuperview()
            }
        }

    }
    func hid() {
        ShowAnimations.share.show(show: false, view: self.tipView)
    }

}
