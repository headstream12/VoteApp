//
//  VotingPresenter.swift
//  VoteApp
//
//  Created by Ilya Glazunov on 5/3/19.
//  Copyright © 2019 Ilya Glazunov. All rights reserved.
//

import UIKit

final class VotingPresenter {
    func loadInfo(onSuccess: ([PTableViewCellAnyModel]) -> (), onError: (Error) -> ()) {
        let headerCellModel = VotingHeaderCellModel(title: "Лучший Игрок Сезона", description: "Сегодня мы выбираем лучшего игрока сезона")
        
        let variantCellModel1 = VotingVariantCellModel(variantText: "Канте", isSelected: false)
        let variantCellModel2 = VotingVariantCellModel(variantText: "Азар", isSelected: false)
        let variantCellModel3 = VotingVariantCellModel(variantText: "Жиру", isSelected: false)
        let variantCellModel4 = VotingVariantCellModel(variantText: "Кепа", isSelected: false)

        
        onSuccess([headerCellModel, variantCellModel1, variantCellModel2, variantCellModel3, variantCellModel4])
    }
}
