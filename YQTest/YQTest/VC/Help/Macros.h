//
//  Macros.h
//  APPHelp
//
//  Created by boli on 2018/8/8.
//  Copyright © 2018年 boli. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

// -- log --
#if DEBUG

#define NSLog(FORMAT, ...) fprintf(stderr, "%s %s %d NSLog  \t%s\n", \
    [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], \
    __PRETTY_FUNCTION__,                                                       \
    __LINE__,                                                                  \
    [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#define DebugLog(FORMAT, ...) fprintf(stderr, "%s %s %d DebugLog   \t%s\n", \
    [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], \
    __PRETTY_FUNCTION__,                                                       \
    __LINE__,                                                                  \
    [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);


#else

#define NSLog(...)
#define DebugLog(...)

#endif


#define NSUserDefaultsForKey(key) [[NSUserDefaults standardUserDefaults] objectForKey:key]

// -- weakSelf --
#define WeakSelf __weak typeof(self) weakSelf = self;
#define StrongSelf __strong typeof(self) strongSelf = weakSelf;

// lock
#define SHLock() dispatch_semaphore_wait(self->_lock, DISPATCH_TIME_FOREVER);
#define SHUnlock() dispatch_semaphore_signal(self->_lock);

// -- Frame --
#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height

#define SCREEN_SCALE(num)  ([UIScreen mainScreen].bounds.size.width/375) * num

// 当前版本
#define SYSTEM_VERSION ([[[UIDevice currentDevice] systemVersion] floatValue])
//App版本号
#define PUBLISH_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
//App build 号
#define BUILD_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]


#endif /* Macros_h */
