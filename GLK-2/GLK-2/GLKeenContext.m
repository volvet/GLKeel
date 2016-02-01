//
//  GLKeenContext.m
//  GLK-2
//
//  Created by Volvet Zhang on 16/2/1.
//  Copyright © 2016年 volvet. All rights reserved.
//

#import "GLKeenContext.h"

@implementation GLKeenContext

- (void) setClearColor:(GLKVector4)clearColorRGB {
    clearColor = clearColorRGB;
    
    NSAssert([[self class] currentContext] == self, @"Unexpected current context");
    
    glClearColor(clearColor.r, clearColor.g, clearColor.b, clearColor.r);
}

- (GLKVector4) clearColor {
    return clearColor;
}

- (void) clear:(GLbitfield)mask {
    glClear(mask);
}

- (void) enable:(GLenum)capability {
    glEnable(capability);
}

- (void) disable:(GLenum)capability {
    glDisable(capability);
}

- (void) setBlendSourceFunction:(GLenum)sfactor destinationFunction:(GLenum)dfactor {
    glBlendFunc(sfactor, dfactor);
}

@end
