# AppCrashRecord
crash崩溃信息捕捉,操作行为记录,上传服务器

log案例

CrashTime: 2020-09-29 154144
Exception reason: *** -[__NSSingleObjectArrayI objectAtIndex:]: index 5 beyond bounds [0 .. 0]
Exception name: NSRangeException
Exception action: (进入)ViewController->(进入)ViewControllerA->(离开)ViewControllerA->(进入)ViewControllerA->(进入)ViewControllerB
Exception call stack: (
    0   CoreFoundation                      0x000000011067a126 __exceptionPreprocess + 242
    1   libobjc.A.dylib                     0x000000011050af78 objc_exception_throw + 48
    2   CoreFoundation                      0x00000001106c2d6e -[__NSSingleObjectArrayI getObjects:range:] + 0
    3   AppCrashRecord                      0x000000010fcfd0d6 -[ViewControllerB touchesBegan:withEvent:] + 166
    4   UIKitCore                           0x0000000113dbb5b7 forwardTouchMethod + 321
    5   UIKitCore                           0x0000000113dbb465 -[UIResponder touchesBegan:withEvent:] + 49
    6   UIKitCore                           0x0000000113dca731 -[UIWindow _sendTouchesForEvent:] + 622
    7   UIKitCore                           0x0000000113dcc843 -[UIWindow sendEvent:] + 4774
    8   UIKitCore                           0x0000000113da6376 -[UIApplication sendEvent:] + 633
    9   UIKitCore                           0x0000000113e368d6 __processEventQueue + 13895
    10  UIKitCore                           0x0000000113e2d26c __eventFetcherSourceCallback + 104
    11  CoreFoundation                      0x00000001105e8845 __CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE0_PERFORM_FUNCTION__ + 17
    12  CoreFoundation                      0x00000001105e873d __CFRunLoopDoSource0 + 180
    13  CoreFoundation                      0x00000001105e7c1f __CFRunLoopDoSources0 + 248
    14  CoreFoundation                      0x00000001105e23f7 __CFRunLoopRun + 878
    15  CoreFoundation                      0x00000001105e1b9e CFRunLoopRunSpecific + 567
    16  GraphicsServices                    0x000000011c485db3 GSEventRunModal + 139
    17  UIKitCore                           0x0000000113d87af3 -[UIApplication _run] + 912
    18  UIKitCore                           0x0000000113d8ca04 UIApplicationMain + 101
    19  AppCrashRecord                      0x000000010fcfbd9a main + 122
    20  libdyld.dylib                       0x0000000111c64415 start + 1
)


