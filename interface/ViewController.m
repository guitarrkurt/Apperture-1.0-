//
//  ViewController.m
//  interface
//
//  Created by SOPORTE on 02/07/14.
//  Copyright (c) 2014 apperture. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)sendMailTapped:(id)sender
{
    if ([MFMailComposeViewController canSendMail])
    {
        //Construimos el viewcontroller para nuestro mail y modificamos los valores inicialies
        MFMailComposeViewController *mailComposer = [[MFMailComposeViewController alloc]init];
        //Asociamos el delegado
        mailComposer.mailComposeDelegate = self;
        
        //Modificamos el color de CANCEL and SEND, in NAVIGATIONBAR
        [[mailComposer navigationBar] setTintColor:[UIColor redColor]];
        
        //Asoiciamos los parametros
        [mailComposer setSubject:@"Apperture"];
        [mailComposer setToRecipients:@[@"contacto@apperture.mx"]];
        [mailComposer setMessageBody:@"Inserte su texto aquí" isHTML:NO];
        
        //Rote en horizontal
        mailComposer.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        //Display
        [self presentViewController:mailComposer animated:YES completion:nil];

    }else{
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:
                                  @"" message:@"Por el momento no puedes enviar emails" delegate:self
                                cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }


}
-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
