//
//  Copyright (c) 2018 Open Whisper Systems. All rights reserved.
//

#import "TSDatabaseSecondaryIndexes.h"
#import "OWSStorage.h"
#import "TSInteraction.h"

#define TSTimeStampSQLiteIndex @"messagesTimeStamp"

@implementation TSDatabaseSecondaryIndexes

+ (YapDatabaseSecondaryIndex *)registerTimeStampIndex {
    YapDatabaseSecondaryIndexSetup *setup = [[YapDatabaseSecondaryIndexSetup alloc] init];
    [setup addColumn:TSTimeStampSQLiteIndex withType:YapDatabaseSecondaryIndexTypeReal];

    YapDatabaseSecondaryIndexWithObjectBlock block =
        ^(YapDatabaseReadTransaction *transaction, NSMutableDictionary *dict, NSString *collection, NSString *key, id object) {

          if ([object isKindOfClass:[TSInteraction class]]) {
              TSInteraction *interaction = (TSInteraction *)object;

              [dict setObject:@(interaction.timestamp) forKey:TSTimeStampSQLiteIndex];
          }
        };

    YapDatabaseSecondaryIndexHandler *handler = [YapDatabaseSecondaryIndexHandler withObjectBlock:block];

    YapDatabaseSecondaryIndex *secondaryIndex = [[YapDatabaseSecondaryIndex alloc]
        initWithSetup:setup
              handler:handler
           versionTag:[OWSStorage appendSuffixToDatabaseExtensionVersionIfNecessary:@"1"]];

    return secondaryIndex;
}


+ (void)enumerateMessagesWithTimestamp:(uint64_t)timestamp
                             withBlock:(void (^)(NSString *collection, NSString *key, BOOL *stop))block
                      usingTransaction:(YapDatabaseReadTransaction *)transaction
{
    NSString *formattedString = [NSString stringWithFormat:@"WHERE %@ = %lld", TSTimeStampSQLiteIndex, timestamp];
    YapDatabaseQuery *query   = [YapDatabaseQuery queryWithFormat:formattedString];
    [[transaction ext:@"idx"] enumerateKeysMatchingQuery:query usingBlock:block];
}

@end
