

#import <Cocoa/Cocoa.h>


@interface TestController : NSObject <NSApplicationDelegate, NSMetadataQueryDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSMetadataQuery *query;

@end
