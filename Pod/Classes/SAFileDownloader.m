//
//  SAFileDownloader.m
//  Pods
//
//  Created by Gabriel Coman on 18/04/2016.
//
//

#import "SAFileDownloader.h"

// defines
#define SA_FILE_STORE @"SA_FILE_STORE"

//
// SuperAwesome file object
@interface SAFileObject : NSObject <NSCoding>

// members
@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) NSString *remoteURL;
@property (nonatomic, strong) NSString *filePath;

// factory contructor
+ (SAFileObject*) fileObjectWithKey:(NSString*)key andUrl:(NSString*)url andPath:(NSString*)path;

@end

@implementation SAFileObject

+ (SAFileObject*) fileObjectWithKey:(NSString *)key andUrl:(NSString *)url andPath:(NSString *)path {
    SAFileObject* fobject = [[SAFileObject alloc] init];
    fobject.key = key;
    fobject.remoteURL = url;
    fobject.filePath = path;
    return fobject;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_key forKey:@"key"];
    [aCoder encodeObject:_filePath forKey:@"filePath"];
    [aCoder encodeObject:_remoteURL forKey:@"remoteURL"];
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]){
        _key = [aDecoder decodeObjectForKey:@"key"];
        _filePath = [aDecoder decodeObjectForKey:@"filePath"];
        _remoteURL = [aDecoder decodeObjectForKey:@"remoteURL"];
    }
    return self;
}

@end

//
// private vars for SAFileDownloader
@interface SAFileDownloader ()
// dictionary that holds all the files currently saved on disk as part of the SDK
@property (nonatomic, strong) NSMutableDictionary *fileStore;
@property (nonatomic, strong) NSFileManager *fileManager;
@property (nonatomic, strong) NSUserDefaults *defs;
@end

//
// actual implementation of SAFileDownloader
@implementation SAFileDownloader

+ (SAFileDownloader *) getInstance {
    static SAFileDownloader *sharedManager = nil;
    @synchronized(self) {
        if (sharedManager == nil){
            sharedManager = [[self alloc] init];
        }
    }
    return sharedManager;
}

- (instancetype) init {
    if (self = [super init]) {
        // get user defaults and file manager
        _defs = [NSUserDefaults standardUserDefaults];
        _fileManager = [NSFileManager defaultManager];
        
        // get the file store
        if ([_defs objectForKey:SA_FILE_STORE]) {
            NSData *encodedObject = [_defs objectForKey:SA_FILE_STORE];
            _fileStore = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
        } else {
            _fileStore = [[NSMutableDictionary alloc] init];
        }
        
        // do a preliminary cleanup
        [self cleanup];
    }
    return self;
}

- (void) downloadFile:(NSString *)url withSuccess:(downloadSuccess)success orFailure:(failure)failure {
    
    // form the URL & request
    NSURL *URL = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:URL];
    [request setHTTPMethod:@"GET"];
    
    // the response
    netresponse resp = ^(NSURLResponse * response, NSData * data, NSError * error) {
        NSInteger statusCode = ((NSHTTPURLResponse*)response).statusCode;
        
        // check for whatever error
        if (error != NULL || statusCode != 200) {
            failure();
        }
        // goto success
        else {
            NSString *key = [SAUtils generateUniqueKey];
            NSString *filePath = [NSString stringWithFormat:@"samov_%@.mp4", key];
            NSString *fullFilePath = [SAUtils filePathInDocuments:filePath];
            NSError *fileError = NULL;
            if (filePath != NULL) {
                [data writeToFile:fullFilePath options:NSDataWritingAtomic error:&error];
            }
            // file written ok
            if (fileError == NULL) {
                // set the new fobject
                SAFileObject *fobject = [SAFileObject fileObjectWithKey:key andUrl:url andPath:filePath];
                [_fileStore setObject:fobject forKey:key];
                NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:_fileStore];
                [_defs setObject:encodedObject forKey:SA_FILE_STORE];
                [_defs synchronize];
                
                // call success
                success(filePath);
            }
            // failure to write file
            else {
                failure();
            }
        }
    };
    
    // make the request and get back the data
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue currentQueue]
                           completionHandler:resp];
}

#pragma mark Aux Functions

- (void) cleanup {
    // cleanup all files from documents directory
    for (NSString *key in _fileStore.allKeys) {
        SAFileObject *fobject = (SAFileObject*)[_fileStore objectForKey:key];
        NSString *fullFilePath = [SAUtils filePathInDocuments:fobject.filePath];
        
        if ([_fileManager fileExistsAtPath:fullFilePath] && [_fileManager isDeletableFileAtPath:fullFilePath]) {
            [_fileManager removeItemAtPath:fullFilePath error:nil];
        }
    }
    
    // and remove all objects
    [_fileStore removeAllObjects];
}

@end
