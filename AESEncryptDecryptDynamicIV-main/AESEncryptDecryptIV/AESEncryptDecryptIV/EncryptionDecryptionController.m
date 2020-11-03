//
//  EncryptionDecryptionController.m
//  AESEncryptDecryptIV
//
//  Created by Abbie on 02/11/20.
//

#import "EncryptionDecryptionController.h"
#import "Crypt.h"
#import "SecurityUtils.h"
#import "FBEncryptorAES.h"

@interface EncryptionDecryptionController ()
{
   // CryptLib *cryptingInstance;
    NSData *encryptedText;
    NSString *encrypted;
}

@end

@implementation EncryptionDecryptionController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)encryptAction:(id)sender {
    NSString *myScretString = @"My secret string";
    NSString *mySecretKey = @"9336365521W5F092BB5909E8E033BC69";
    NSString* str= @"AEE0715D0778A4E4";
    NSData* iv=[str dataUsingEncoding:NSUTF8StringEncoding];
   // NSData* iv = [FBEncryptorAES generateIv];
    NSString* hexString = [FBEncryptorAES hexStringForData:iv];
    NSString *iv_string = [iv base64EncodedStringWithOptions:0];
    NSLog(@"IV string: %@",iv_string);
    NSLog(@"HexIVV%@", hexString);
    NSLog(@"LengthDATAIV%lu", (unsigned long)[iv length]);
    NSData* encryptedData = [FBEncryptorAES encryptData:[myScretString dataUsingEncoding:NSUTF8StringEncoding]
                                                    key:[mySecretKey dataUsingEncoding:NSUTF8StringEncoding]
                                                     iv:iv];
    NSLog(@"encryptedWithDynamicIV: %@", [encryptedData base64EncodedStringWithOptions:0]);
    
    NSString *base64Encoded = @"odsVJhFeVSfi4DbvKdr5Bb60t1QcA4boxEPzayJU7yv8Or8wmACH4z4/c/j+pO2j";
     NSData *nsdataFromBase64String = [[NSData alloc] initWithBase64EncodedString:base64Encoded options:0];
    NSData* decryptedData = [FBEncryptorAES decryptData:nsdataFromBase64String
                                                    key:[mySecretKey dataUsingEncoding:NSUTF8StringEncoding]
                                                     iv:iv];
    NSLog(@"decryptedWithDynamicIV: %@", [[NSString alloc] initWithData:decryptedData encoding:NSUTF8StringEncoding]);
}
- (IBAction)decryptAction:(id)sender {
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
