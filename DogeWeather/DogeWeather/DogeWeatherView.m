//
//  DogeWeatherView.m
//  DogeWeather
//
//  Created by snare on 29/01/2014.
//  Copyright (c) 2014 snare. All rights reserved.
//

#import "DogeWeatherView.h"

@implementation DogeWeatherView

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self)
    {
        _webView = [[WebView alloc] initWithFrame:[self bounds]];
        [self setAutoresizingMask:NSViewWidthSizable|NSViewHeightSizable];
        [self setAutoresizesSubviews:YES];
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
    
    [_webView setMainFrameURL:@"http://dogeweather.com"];
    [_webView setFrameLoadDelegate:self];
    [_webView setShouldUpdateWhileOffscreen:YES];
    [_webView setDrawsBackground:NO];
    [_webView setAlphaValue:0.0];
    
    [self addSubview:_webView];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

- (void)webView:(WebView *)webView didFinishLoadForFrame:(WebFrame *)frame
{
    if (frame == [_webView mainFrame])
    {
        NSDictionary *attrs = [NSDictionary dictionaryWithObjectsAndKeys:
                               _webView, NSViewAnimationTargetKey,
                               NSViewAnimationFadeInEffect, NSViewAnimationEffectKey,
                               nil];
        
        NSViewAnimation *anim = [[NSViewAnimation alloc] initWithViewAnimations:[NSArray arrayWithObjects: attrs, nil]];
        
        [anim setDuration:0.5];
        [anim setAnimationCurve:NSAnimationEaseInOut];
        [anim setAnimationBlockingMode:NSAnimationBlocking];
        [anim setDelegate:self];
        [anim startAnimation];
    }
}

- (void)animationDidEnd:(NSAnimation *)animation
{
    [_webView setAlphaValue:1.0];
}

@end

