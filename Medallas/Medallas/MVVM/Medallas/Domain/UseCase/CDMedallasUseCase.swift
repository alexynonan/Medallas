//
//  CDMedallasUseCase.swift
//  Medallas
//
//  Created by Alexander Ynoñan H. on 17/10/25.
//

import UIKit

protocol CDMedallasUseCase {
    func saveMedallas(list: [UIMedalla])
    func deleteMedallas()
}
