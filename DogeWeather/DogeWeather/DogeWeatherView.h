//
//  DogeWeatherView.h
//  DogeWeather
//
//  Created by snare on 29/01/2014.
//  Copyright (c) 2014 snare. All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>
#import <WebKit/WebKit.h>

@interface DogeWeatherView : ScreenSaverView <NSAnimationDelegate>
{
    WebView *_webView;
}

@end
