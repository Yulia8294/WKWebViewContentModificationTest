//
//  Scripts.swift
//  WebView
//
//  Created by Yulia Novikova on 6/3/20.
//  Copyright © 2020 Yulia. All rights reserved.
//

import Foundation

class Scripts {
    
    static var hideElements =
        """
          document.querySelector('.app-store-link.small').style.display='none';
          document.querySelector('.footer-section').style.display='none';
          document.querySelector('.footer-section').style.display='none';
          document.querySelector('.app-store-link.mobile').style.display='none';
          document.getElementById('menu-landing_menu').style.display='none';
          document.querySelector('.col.col-12.col-md-6.col-lg-5.col-xl-4').style.display='none';
          document.querySelector('.d-flex.justify-content-center.py-5 ').remove('.d-flex');
        """
    
}
