//
//  BottomSheet.swift
//  Project
//
//  Created by Abu Nabe on 17/9/21.
//

import UIKit

class MapViewSheet: UIViewController {
    // 1
    var privacy = "no"
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
    // 2
    let maxDimmedAlpha: CGFloat = 0.6
    lazy var dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = maxDimmedAlpha
        return view
    }()
    
    let defaultHeight: CGFloat = 300
    
    // 3. Dynamic container constraint
    var containerViewHeightConstraint: NSLayoutConstraint?
    var containerViewBottomConstraint: NSLayoutConstraint?
    
    let dismissibleHeight: CGFloat = 200
    let maximumContainerHeight: CGFloat = UIScreen.main.bounds.height - 64
    // keep updated with new height
    var currentContainerHeight: CGFloat = 300
    
    let profileImageView: UIImageView = {
        let profileimage = UIImageView()
        
        profileimage.contentMode = .scaleAspectFill
        profileimage.clipsToBounds = true
        profileimage.layer.borderWidth = 2
        profileimage.image = UIImage(named: "2")
        return profileimage
    }()
    
    let NameLabel: UILabel = {
        let Label = UILabel()
        Label.textAlignment = .center
        Label.text = "Username"
        Label.font = .boldSystemFont(ofSize: 12)
        return Label
    }()
    
    let countryImageView: UIImageView = {
        let profileimage = UIImageView()
        
        profileimage.contentMode = .scaleAspectFill
        profileimage.clipsToBounds = true
        profileimage.layer.borderWidth = 2
        profileimage.image = UIImage(named: "toyota")
        return profileimage
    }()
    
    let HobbyLabel: UILabel = {
        let Label = UILabel()
        Label.textAlignment = .center
        Label.text = "Toyota"
        Label.font = .boldSystemFont(ofSize: 12)
    
        return Label
    }()
   
    private let BlackView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "Basic")
        
        return view
    }()
    
    
    private let PurplePoint: UILabel = {
        let label = UILabel()
        label.text = "4.5"
        label.textAlignment = .center
        label.textColor = UIColor(named: "Basic")
        return label
    }()
   
    private let purpleCircle: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(systemName: "star.fill")?.withRenderingMode(.alwaysTemplate)
        imageview.tintColor = .yellow
        imageview.contentMode = UIView.ContentMode.scaleAspectFit
        
        return imageview
    }()
    
    private let VisitButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.setTitle("Message", for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    
    private let FollowButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.setTitle("Arriving", for: .normal)
        button.backgroundColor = .blue
        return button
    }()

//    private let MessageButton: UIButton = {
//        let button = UIButton()
//        button.setTitleColor(.white, for: .normal)
//        button.layer.cornerRadius = 4
//        button.setTitle("Message".localized(), for: .normal)
//        button.backgroundColor = UIColor(named: "Purple")
//        return button
//    }()
    
    private let centerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    func animateShowDimmedView() {
        dimmedView.alpha = 0
        UIView.animate(withDuration: 0.4) {
            self.dimmedView.alpha = self.maxDimmedAlpha
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateShowDimmedView()
        animatePresentContainer()
    }
    
    func animatePresentContainer() {
        // Update bottom constraint in animation block
        UIView.animate(withDuration: 0.3) {
            self.containerViewBottomConstraint?.constant = 0
            // Call this to trigger refresh constraint
            self.view.layoutIfNeeded()
        }
    }

    func setupView() {
        view.backgroundColor = .clear
    }
    
    func setupConstraints() {
        // 4. Add subviews
        view.addSubview(dimmedView)
        view.addSubview(containerView)
        dimmedView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        // 5. Set static constraints
        NSLayoutConstraint.activate([
            // set dimmedView edges to superview
            dimmedView.topAnchor.constraint(equalTo: view.topAnchor),
            dimmedView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            dimmedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dimmedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            // set container static constraint (trailing & leading)
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        // 6. Set container to default height
        containerViewHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: defaultHeight)
        // 7. Set bottom constant to 0
        containerViewBottomConstraint = containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        // Activate constraints
        containerViewHeightConstraint?.isActive = true
        containerViewBottomConstraint?.isActive = true
        
        containerViewBottomConstraint = containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: defaultHeight)
        
        containerView.addSubview(profileImageView)
        containerView.addSubview(NameLabel)
        containerView.addSubview(countryImageView)
        containerView.addSubview(HobbyLabel)
        containerView.addSubview(BlackView)
        containerView.addSubview(PurplePoint)
        containerView.addSubview(purpleCircle)
        containerView.addSubview(VisitButton)
        containerView.addSubview(FollowButton)
//        containerView.addSubview(MessageButton)
        containerView.addSubview(centerView)
        
        profileImageView.anchor(top: NameLabel.bottomAnchor,left: view.leftAnchor, paddingTop: 2, paddingLeft: 30,width: 100, height: 100)
        profileImageView.layer.cornerRadius = 100/2

        countryImageView.anchor(top: NameLabel.bottomAnchor,right: view.rightAnchor, paddingTop: 2, paddingRight: 30,width: 100, height: 100)
        countryImageView.layer.cornerRadius = 100/2

        NameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        HobbyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        NameLabel.anchor(top: containerView.topAnchor, paddingTop: 5)
        
        HobbyLabel.anchor(top: NameLabel.bottomAnchor, paddingTop: 2)
        
        
        PurplePoint.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
        PurplePoint.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        PurplePoint.anchor(paddingLeft: 0)
        
        purpleCircle.centerXAnchor.constraint(equalTo: PurplePoint.centerXAnchor).isActive = true
        purpleCircle.anchor(top: PurplePoint.bottomAnchor, width: 35, height: 35)
        
//        centerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        centerView.anchor(paddingTop: 0)
//
  
        FollowButton.anchor(left: view.leftAnchor,bottom: view.bottomAnchor, paddingLeft: 40 , paddingBottom: 80, width: 150, height: 40)


        VisitButton.anchor(bottom: view.bottomAnchor, right: view.rightAnchor, paddingBottom: 80, paddingRight: 40, width: 150, height: 40)
        
        
//
//        VisitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        VisitButton.anchor(top: MessageButton.bottomAnchor, paddingTop: 15, width: VisitButton.intrinsicContentSize.width+50, height: 40)

//        let tap2 = UITapGestureRecognizer(target: self, action: #selector(goToMessages))
//            MessageButton.isUserInteractionEnabled = true
//            MessageButton.addGestureRecognizer(tap2)
        
//        let tap3 = UITapGestureRecognizer(target: self, action: #selector(goToProfile))
//            VisitButton.isUserInteractionEnabled = true
//            VisitButton.addGestureRecognizer(tap3)

        let cancelTap = UITapGestureRecognizer(target: self, action: #selector(dismissThis))
            dimmedView.isUserInteractionEnabled = true
            dimmedView.addGestureRecognizer(cancelTap)
        
    }
    
    @objc func goToMessages()
    {
        
    }
    
    
    @objc func dismissThis()
    {
        self.dismiss(animated: false)
    }
        
    func setupPanGesture() {
        // add pan gesture recognizer to the view controller's view (the whole screen)
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture(gesture:)))
        // change to false to immediately listen on gesture movement
        panGesture.delaysTouchesBegan = false
        panGesture.delaysTouchesEnded = false
        view.addGestureRecognizer(panGesture)
    }
    
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        // drag to top will be minus value and vice versa
        print("Pan gesture y offset: \(translation.y)")

        // get drag direction
        let isDraggingDown = translation.y > 0
        print("Dragging direction: \(isDraggingDown ? "going down" : "going up")")
    }
    
    func animateDismissView() {
        // hide main container view by updating bottom constraint in animation block
        UIView.animate(withDuration: 0.3) {
            self.containerViewBottomConstraint?.constant = self.defaultHeight
            // call this to trigger refresh constraint
            self.view.layoutIfNeeded()
        }
        
        // hide blur view
        dimmedView.alpha = maxDimmedAlpha
        UIView.animate(withDuration: 0.4) {
            self.dimmedView.alpha = 0
        } completion: { _ in
            // once done, dismiss without animation
            self.dismiss(animated: false)
        }
    }
    
}
