
#import "TestController.h"

@implementation TestController

@synthesize window = _window;
@synthesize text = _text;
@synthesize query = _query;

- (id)init {
    self = [super init];
    if (self) {
        self.query = [[NSMetadataQuery alloc] init];
        self.query.searchScopes = [NSArray arrayWithObject:NSMetadataQueryLocalComputerScope];
        self.query.predicate = [NSPredicate predicateWithFormat:@"kMDItemTextContent LIKE[cd] %@", @"test"];
        self.query.delegate = self;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(queryNote:)
                                                     name:nil
                                                   object:self.query];

        [self.query startQuery];
        [self addObserver:self forKeyPath:@"text" options:0 context:NULL];
    }
    return self;
}

- (void)queryNote:(NSNotification *)note {
    NSLog(@"queryNote: %@", [note name]);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"text"]) {
        NSString *str = self.text ? self.text : @"test";
        self.query.predicate = [NSPredicate predicateWithFormat:@"kMDItemTextContent LIKE[cd] %@", str];
    }
}

@end
