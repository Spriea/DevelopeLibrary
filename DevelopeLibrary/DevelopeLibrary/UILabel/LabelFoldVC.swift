//
//  LabelFoldVC.swift
//  DevelopeLibrary
//
//  Created by Link on 2022/9/2.
//

import UIKit
import SnapKit

class LabelFoldVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let label = UILabel()
        label.numberOfLines = 5
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        view.addSubview(label)
        
        label.text = "在平平淡淡的学习、工作、生活中，大家都有写作文的经历，对作文很是熟悉吧，作文一定要做到主题集中，围绕同一主题作深入阐述，切忌东拉西扯，主题涣散甚至无主题。写起作文来就毫无头绪？下面是小编精心整理的高二语文作文，供大家参考借鉴，希望可以帮助到有需要的朋友。也许长时间以来，你的生活并没有任何起色。你为改变命运所做的一切努力，也没有得到回报。似乎你已无法跨越前方的障碍，但请相信没有过不去的火焰山，只要你坚持到底，永不放弃，你就能到达成功的彼岸。有的人胸怀大志，并且很有天赋，却因为家庭环境不好而没有一些条件来助他们取得成功。他们一次又一次地努力拼搏，却遭到一次又一次的失败打击，在多次的打击后，终于他们丧失了信心，意志也被磨灭，那改变命运的梦想也随之破灭。其实，他们应该去看看大海，看看海风刮起海浪澎湃的景象，看看被礁石击成碎片的浪花不退缩的继续努力。海浪的品格，就是无数次地被礁石击碎，又无数次地扑向礁石。失败是不可避免的，当心灵受到一次次打击时，他们应当如海浪一般继续去尝试，去拼搏。愈挫愈勇和锲而不舍是翻越人生的“火焰山”必不可少的精神。正所谓不经历风雨怎能见彩虹，如果你无法克服所遇的障碍，那么在人生长途中你又怎能一展宏图？林肯出生卑微，一身孤苦奋斗，厄运连连，屡战屡败，但坚持不懈的他最终成就了辉煌。林肯也曾为他所遇的困难心碎过、痛苦过、崩溃过。有好多次，都绝望至极，担心自己会不再爬起来。林肯对自己的评价就是：“虽然心碎，但依然火热；虽然痛苦，但依然镇定；虽然崩溃，但依然自信。因为我坚信，即便我的家庭并没有很好的条件来帮助我，但这并不代表我不能成功。”在林肯当选总统那一刻，整个参议院的议员都感到很不服气，因为林肯的父亲是个鞋匠。而当时的参议员大都出身名门望族，自认为是上流人士，怎可容忍自己面对的总统是一个卑微的鞋匠的儿子。所以，当林肯首次站在参议院的演讲台上时，一位态度傲慢的参议员便羞辱他说：“林肯先生，在你开始演讲之前，我希望你记住，你是一个鞋匠的儿子。”台下的参议员立刻哄笑起来。"
        
        
        
        label.snp.makeConstraints { make in
            make.top.equalTo(100)
            make.right.equalToSuperview().offset(-16)
            make.left.equalToSuperview().offset(16)
        }
        
        let openBtn = UIButton()
        view.addSubview(openBtn)
        openBtn.setTitleColor(.black, for: .normal)
        openBtn.titleLabel?.font = .systemFont(ofSize: 16)
        let attstring = NSMutableAttributedString.init(string: "...展开")
        attstring.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 3, length: 2))
        openBtn.setAttributedTitle(attstring, for: .normal)
        
        openBtn.snp.makeConstraints { make in
            make.right.equalTo(label)
            make.bottom.equalTo(label)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
