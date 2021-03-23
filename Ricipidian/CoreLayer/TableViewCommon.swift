//
//  TableViewCommon.swift
//  Ricipidian
//
//  Created by Minh Tâm on 22/03/2021.
//

import RxCocoa
import RxSwift
import SnapKit
import UIKit

class TableViewCommon: CustomTableView {
    private var lbNoData: UILabel?

    override func setupTableView() {
        super.setupTableView()
        configSelectionStyle(selectionStyle: .none, separatorStyle: .none)
        sectionHeaderHeight = UITableView.automaticDimension

        addViewLoading()
        addViewNoData()
    }

    func getTitleLabel(_ section: Int) -> UILabel {
        let lable = UILabel(frame: .zero)
        lable.font = UIFont.systemFont(ofSize: 18)
        lable.textColor = .black
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.numberOfLines = 0
        let sectionViewModel = baseViewModel.sectionViewModels.value[section]
        let text = sectionViewModel.headerTitle ?? ""
        lable.text = text

        return lable
    }

    func heightHeaderSection() -> CGFloat {
        return CGFloat(50)
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return heightHeaderSection()
    }

    func getSpaceBottomTitleOfSection(_ section: Int) -> Int {
        var spaceBottom = -16
        if section != 0 {
            spaceBottom = 0
        }
        return spaceBottom
    }

    func headerSectionColor(_ section: Int) -> UIColor {
        return .white
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = headerSectionColor(section)

        let lable = getTitleLabel(section)

        if lable.text.isNilOrEmpty {
            headerView.backgroundColor = .red
            return nil
        }

        headerView.addSubview(lable)
        let spaceBottom = getSpaceBottomTitleOfSection(section)

        lable.snp.makeConstraints { view in
            view.top.equalTo(headerView.snp.top).offset(16)
            view.leading.equalTo(headerView.snp.leading).offset(16)
            view.trailing.equalTo(headerView.snp.trailing).offset(-16)
            view.bottom.equalTo(headerView.snp.bottom).offset(spaceBottom)
        }
        return headerView
    }

    override func bindViewModel() {
        baseViewModel.sectionViewModels.subscribeShort(skip: 1) { [weak self] listData in
            if listData.isEmpty {
                self?.showMessageNoData(isShow: true)
            } else {
                self?.showMessageNoData(isShow: false)
            }

            self?.reloadData()
        }.disposed(by: disposeBag)

        detectScrollToBottom()
    }

    func addViewNoData() {
        lbNoData = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        lbNoData?.text = "MessageNoData".localized
        lbNoData?.textAlignment = .center
        lbNoData?.textColor = .gray
        addSubview(lbNoData!)
        lbNoData?.isHidden = true
        lbNoData?.anchorCenterSuperview()
    }
}

extension TableViewCommon {
    func addViewLoading() {
    }

    func startLoading() {
    }

    func stopLoading() {
    }

    func showMessageNoData(isShow: Bool) {
        lbNoData?.isHidden = !isShow
    }
}
