//
//  SystemConfigurationInterface.m
//  MunkiStatus
//
//  Created by Greg Neagle on 4/23/09.
/*
* Copyright 2009 Greg Neagle.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
* 
*      http://www.apache.org/licenses/LICENSE-2.0
* 
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import "SystemConfigurationInterface.h"

@implementation NSApplication (ASKAMultiLanguage)

- (NSString *)consoleUser
{
	CFStringRef		cfuser = NULL;
	NSString		*username;
    
    cfuser = SCDynamicStoreCopyConsoleUser( NULL, NULL, NULL );
        
    if ( cfuser != NULL ) {
		username = [ ( NSString * )cfuser retain ];
		CFRelease( cfuser );
    } else {
		username = @"";
	}
	return username;
}

@end