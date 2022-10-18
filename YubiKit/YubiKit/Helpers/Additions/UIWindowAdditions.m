// Copyright 2018-2019 Yubico AB
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import "UIWindowAdditions.h"

@implementation ykf_safeAreaInsets

- (UIEdgeInsets)ykf_safeAreaInsets {
    if (@available(iOS 13, *)) {
        
        NSSet *windows = UIApplication.sharedApplication.connectedScenes;
        for (UIWindow* window in windows) {
            if (window.windowScene.activationState == UISceneActivationStateForegroundActive) {
                return window.safeAreaInsets;
            }
        }
    }
    return UIEdgeInsetsZero;
}

@end

