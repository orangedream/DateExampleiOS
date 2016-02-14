//
//  DateHandleExampleTableViewController.m
//  DateHandleExample
//
//  Created by Orange Chang on 2016/2/9.
//  Copyright © 2016年 iotec. All rights reserved.
//

#import "DateHandleExampleTableViewController.h"

@interface DateHandleExampleTableViewController ()
@property (strong, nonatomic) IBOutlet UITextField *formatDateTextField;

@end

@implementation DateHandleExampleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - button actions
- (IBAction)currentTimeClicked:(id)sender {
    NSDate *currentDate=[NSDate date];
    NSLog(@"currentDate=%@",currentDate);
}
- (IBAction)localTimeClicked:(id)sender {
    NSDate *currentDate=[NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterMediumStyle];
    
    NSString *currentDateString = [formatter stringFromDate:currentDate];
    NSLog(@"currentDate=%@", currentDateString);

}
- (IBAction)checkLocaleClicked:(id)sender {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSLog(@"NSDateFormatter.locale=%@",formatter.locale.localeIdentifier);
    NSLog(@"NSDateFormatter.timeZone=%@",formatter.timeZone);
}
- (IBAction)taiwanTimeClicked:(id)sender {
    NSDate *currentDate=[NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterMediumStyle];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_Hant_TW"]];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Taipei"]];
    
    NSString *currentDateString = [formatter stringFromDate:currentDate];
    NSLog(@"Taiwan time=%@", currentDateString);
}
- (IBAction)formatedDateClicked:(id)sender {
    // setup date format
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_Hant_TW"]];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Taipei"]];
    [formatter setDateFormat:_formatDateTextField.text];
    // Date to string
    NSDate *now = [NSDate date];
    NSString *currentDateString = [formatter stringFromDate:now];
    NSLog(@"currentDate=%@", currentDateString);
}
- (IBAction)rocDateClicked:(id)sender {
    // setup date format
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_Hant_TW"]];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Taipei"]];
    [formatter setDateFormat:@"民國yyy年 M月 d日 (eeee)"];
    [formatter setCalendar:[[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierRepublicOfChina]];
    // Date to string
    NSDate *now = [NSDate date];
    NSString *currentDateString = [formatter stringFromDate:now];
    NSLog(@"currentDate=%@", currentDateString);
}
- (IBAction)testCodeClicked:(id)sender {
    // setup date format
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_Hant_TW"]];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Taipei"]];
    [formatter setDateFormat:@"YYYY年 M月 d日"];
    // Date to string
    NSDate *now = [NSDate date];
    NSString *currentDateString = [formatter stringFromDate:now];
    NSLog(@"currentDate=%@", currentDateString);
}
- (IBAction)chineseFarmerDateClicked:(id)sender {
    // setup date format
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_Hant_TW"]];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Taipei"]];
    [formatter setDateFormat:@"UUU年 M月 d日"];
    [formatter setCalendar:[[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese]];
    // Date to string
    NSDate *now = [NSDate date];
    NSString *currentDateString = [formatter stringFromDate:now];
    NSLog(@"currentDate=%@", currentDateString);

}
- (IBAction)stringToDateClicked:(id)sender {
    NSString *dateString = @"2016/2/9";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

    // Make sure it's matched format!
    [dateFormatter setDateFormat:@"yyyy/M/d"];
    NSDate *date = [[NSDate alloc] init];

    date = [dateFormatter dateFromString:dateString];
    
    NSLog(@"date=%@", date);

}
- (IBAction)daysBetweenClicked:(id)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/M/d"];
    
    NSDate *date1 = [dateFormatter dateFromString:@"2013/1/30"];
    NSDate *date2 = [dateFormatter dateFromString:@"2016/2/9"];
    NSDateComponents *components;
    NSInteger numberOfDays;
    
    components = [[NSCalendar currentCalendar] components: NSCalendarUnitDay
                                                 fromDate: date1 toDate: date2 options: 0];
    numberOfDays = [components day];
    
    NSLog(@"Total days=%ld", numberOfDays);
}
- (IBAction)beginOfTodayClicked:(id)sender {
    NSDate *now=[NSDate date];
    NSCalendar *cal=[NSCalendar currentCalendar];
    NSDate *beginOfToday= [cal startOfDayForDate:now];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/M/d HH:mm:ss"];

    NSLog(@"Begin of today=%@",[dateFormatter stringFromDate:beginOfToday]);
    
}
- (IBAction)beginOfWeekClicked:(id)sender {

    NSDate *now=[NSDate date];
    NSCalendar *cal=[NSCalendar currentCalendar];
    
    NSDateComponents *comp = [cal components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:now];
    [comp setDay:1];
    NSDate *firstDayOfMonthDate = [cal dateFromComponents:comp];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/M/d HH:mm:ss"];
    
    NSLog(@"Begin of this month=%@",[dateFormatter stringFromDate:firstDayOfMonthDate]);


}
- (IBAction)thirtyDaysAfterClicked:(id)sender {
    NSDate *now=[NSDate date];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:30];
    NSDate *thirtyDaysAgo = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:now options:0];

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/M/d HH:mm:ss"];
    
    NSLog(@"Begin of this month=%@",[dateFormatter stringFromDate:thirtyDaysAgo]);

}
- (IBAction)toUnixTimestampClicked:(id)sender {
    NSDate *now=[NSDate date];
    NSTimeInterval timeStamp = [now timeIntervalSince1970];
    // NSTimeInterval is defined as double
    NSNumber *timeStampObj = [NSNumber numberWithDouble: timeStamp];
    NSLog(@"Unix timestamp=%ld", [timeStampObj longValue]);

}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 16;
}



@end
