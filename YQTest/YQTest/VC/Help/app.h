//
//  app.h
//  SHParent
//
//  Created by boli on 2018/8/24.
//  Copyright © 2018年 boli. All rights reserved.
//

#ifndef app_h
#define app_h

#define BaseURL @""

#define HUD_Duration 1.5


typedef NS_ENUM(NSInteger, BillStatus) {
    BillStatusAll = 0,
    BillStatusWaitForTheOtherPartyToConfirm, // 待对方确认
    BillStatusPrePayment, // 代付款
    BillStatusDone,
    BillStatusFailure
};

#endif /* app_h */
