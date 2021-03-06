/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "ABI34_0_0RCTWKWebViewManager.h"

#import "ABI34_0_0RCTUIManager.h"
#import "ABI34_0_0RCTWKWebView.h"
#import <ReactABI34_0_0/ABI34_0_0RCTDefines.h>

@interface ABI34_0_0RCTWKWebViewManager () <ABI34_0_0RCTWKWebViewDelegate>
@end

@implementation ABI34_0_0RCTWKWebViewManager
{
  NSConditionLock *_shouldStartLoadLock;
  BOOL _shouldStartLoad;
}

ABI34_0_0RCT_EXPORT_MODULE()

- (UIView *)view
{
  ABI34_0_0RCTWKWebView *webView = [ABI34_0_0RCTWKWebView new];
  webView.delegate = self;
  return webView;
}

ABI34_0_0RCT_EXPORT_VIEW_PROPERTY(source, NSDictionary)
ABI34_0_0RCT_EXPORT_VIEW_PROPERTY(onLoadingStart, ABI34_0_0RCTDirectEventBlock)
ABI34_0_0RCT_EXPORT_VIEW_PROPERTY(onLoadingFinish, ABI34_0_0RCTDirectEventBlock)
ABI34_0_0RCT_EXPORT_VIEW_PROPERTY(onLoadingError, ABI34_0_0RCTDirectEventBlock)
ABI34_0_0RCT_EXPORT_VIEW_PROPERTY(onShouldStartLoadWithRequest, ABI34_0_0RCTDirectEventBlock)
ABI34_0_0RCT_EXPORT_VIEW_PROPERTY(injectedJavaScript, NSString)
ABI34_0_0RCT_EXPORT_VIEW_PROPERTY(allowsInlineMediaPlayback, BOOL)
ABI34_0_0RCT_EXPORT_VIEW_PROPERTY(mediaPlaybackRequiresUserAction, BOOL)
#if WEBKIT_IOS_10_APIS_AVAILABLE
ABI34_0_0RCT_EXPORT_VIEW_PROPERTY(dataDetectorTypes, WKDataDetectorTypes)
#endif
ABI34_0_0RCT_EXPORT_VIEW_PROPERTY(contentInset, UIEdgeInsets)
ABI34_0_0RCT_EXPORT_VIEW_PROPERTY(automaticallyAdjustContentInsets, BOOL)

/**
 * Expose methods to enable messaging the webview.
 */
ABI34_0_0RCT_EXPORT_VIEW_PROPERTY(messagingEnabled, BOOL)
ABI34_0_0RCT_EXPORT_VIEW_PROPERTY(onMessage, ABI34_0_0RCTDirectEventBlock)

ABI34_0_0RCT_EXPORT_METHOD(postMessage:(nonnull NSNumber *)ReactABI34_0_0Tag message:(NSString *)message)
{
  [self.bridge.uiManager addUIBlock:^(__unused ABI34_0_0RCTUIManager *uiManager, NSDictionary<NSNumber *, ABI34_0_0RCTWKWebView *> *viewRegistry) {
    ABI34_0_0RCTWKWebView *view = viewRegistry[ReactABI34_0_0Tag];
    if (![view isKindOfClass:[ABI34_0_0RCTWKWebView class]]) {
      ABI34_0_0RCTLogError(@"Invalid view returned from registry, expecting ABI34_0_0RCTWebView, got: %@", view);
    } else {
      [view postMessage:message];
    }
  }];
}

ABI34_0_0RCT_CUSTOM_VIEW_PROPERTY(bounces, BOOL, ABI34_0_0RCTWKWebView) {
  view.bounces = json == nil ? true : [ABI34_0_0RCTConvert BOOL: json];
}

ABI34_0_0RCT_CUSTOM_VIEW_PROPERTY(scrollEnabled, BOOL, ABI34_0_0RCTWKWebView) {
  view.scrollEnabled = json == nil ? true : [ABI34_0_0RCTConvert BOOL: json];
}

ABI34_0_0RCT_CUSTOM_VIEW_PROPERTY(decelerationRate, CGFloat, ABI34_0_0RCTWKWebView) {
  view.decelerationRate = json == nil ? UIScrollViewDecelerationRateNormal : [ABI34_0_0RCTConvert CGFloat: json];
}

ABI34_0_0RCT_EXPORT_METHOD(injectJavaScript:(nonnull NSNumber *)ReactABI34_0_0Tag script:(NSString *)script)
{
  [self.bridge.uiManager addUIBlock:^(__unused ABI34_0_0RCTUIManager *uiManager, NSDictionary<NSNumber *, ABI34_0_0RCTWKWebView *> *viewRegistry) {
    ABI34_0_0RCTWKWebView *view = viewRegistry[ReactABI34_0_0Tag];
    if (![view isKindOfClass:[ABI34_0_0RCTWKWebView class]]) {
      ABI34_0_0RCTLogError(@"Invalid view returned from registry, expecting ABI34_0_0RCTWebView, got: %@", view);
    } else {
      [view injectJavaScript:script];
    }
  }];
}

ABI34_0_0RCT_EXPORT_METHOD(goBack:(nonnull NSNumber *)ReactABI34_0_0Tag)
{
  [self.bridge.uiManager addUIBlock:^(__unused ABI34_0_0RCTUIManager *uiManager, NSDictionary<NSNumber *, ABI34_0_0RCTWKWebView *> *viewRegistry) {
    ABI34_0_0RCTWKWebView *view = viewRegistry[ReactABI34_0_0Tag];
    if (![view isKindOfClass:[ABI34_0_0RCTWKWebView class]]) {
      ABI34_0_0RCTLogError(@"Invalid view returned from registry, expecting ABI34_0_0RCTWebView, got: %@", view);
    } else {
      [view goBack];
    }
  }];
}

ABI34_0_0RCT_EXPORT_METHOD(goForward:(nonnull NSNumber *)ReactABI34_0_0Tag)
{
  [self.bridge.uiManager addUIBlock:^(__unused ABI34_0_0RCTUIManager *uiManager, NSDictionary<NSNumber *, ABI34_0_0RCTWKWebView *> *viewRegistry) {
    ABI34_0_0RCTWKWebView *view = viewRegistry[ReactABI34_0_0Tag];
    if (![view isKindOfClass:[ABI34_0_0RCTWKWebView class]]) {
      ABI34_0_0RCTLogError(@"Invalid view returned from registry, expecting ABI34_0_0RCTWebView, got: %@", view);
    } else {
      [view goForward];
    }
  }];
}

ABI34_0_0RCT_EXPORT_METHOD(reload:(nonnull NSNumber *)ReactABI34_0_0Tag)
{
  [self.bridge.uiManager addUIBlock:^(__unused ABI34_0_0RCTUIManager *uiManager, NSDictionary<NSNumber *, ABI34_0_0RCTWKWebView *> *viewRegistry) {
    ABI34_0_0RCTWKWebView *view = viewRegistry[ReactABI34_0_0Tag];
    if (![view isKindOfClass:[ABI34_0_0RCTWKWebView class]]) {
      ABI34_0_0RCTLogError(@"Invalid view returned from registry, expecting ABI34_0_0RCTWebView, got: %@", view);
    } else {
      [view reload];
    }
  }];
}

ABI34_0_0RCT_EXPORT_METHOD(stopLoading:(nonnull NSNumber *)ReactABI34_0_0Tag)
{
  [self.bridge.uiManager addUIBlock:^(__unused ABI34_0_0RCTUIManager *uiManager, NSDictionary<NSNumber *, ABI34_0_0RCTWKWebView *> *viewRegistry) {
    ABI34_0_0RCTWKWebView *view = viewRegistry[ReactABI34_0_0Tag];
    if (![view isKindOfClass:[ABI34_0_0RCTWKWebView class]]) {
      ABI34_0_0RCTLogError(@"Invalid view returned from registry, expecting ABI34_0_0RCTWebView, got: %@", view);
    } else {
      [view stopLoading];
    }
  }];
}

#pragma mark - Exported synchronous methods

- (BOOL)          webView:(ABI34_0_0RCTWKWebView *)webView
shouldStartLoadForRequest:(NSMutableDictionary<NSString *, id> *)request
             withCallback:(ABI34_0_0RCTDirectEventBlock)callback
{
  _shouldStartLoadLock = [[NSConditionLock alloc] initWithCondition:arc4random()];
  _shouldStartLoad = YES;
  request[@"lockIdentifier"] = @(_shouldStartLoadLock.condition);
  callback(request);

  // Block the main thread for a maximum of 250ms until the JS thread returns
  if ([_shouldStartLoadLock lockWhenCondition:0 beforeDate:[NSDate dateWithTimeIntervalSinceNow:.25]]) {
    BOOL returnValue = _shouldStartLoad;
    [_shouldStartLoadLock unlock];
    _shouldStartLoadLock = nil;
    return returnValue;
  } else {
    ABI34_0_0RCTLogWarn(@"Did not receive response to shouldStartLoad in time, defaulting to YES");
    return YES;
  }
}

ABI34_0_0RCT_EXPORT_METHOD(startLoadWithResult:(BOOL)result lockIdentifier:(NSInteger)lockIdentifier)
{
  if ([_shouldStartLoadLock tryLockWhenCondition:lockIdentifier]) {
    _shouldStartLoad = result;
    [_shouldStartLoadLock unlockWithCondition:0];
  } else {
    ABI34_0_0RCTLogWarn(@"startLoadWithResult invoked with invalid lockIdentifier: "
               "got %lld, expected %lld", (long long)lockIdentifier, (long long)_shouldStartLoadLock.condition);
  }
}

@end
