#include <stdio.h>
#include <process.h>
#include <string.h>
#include <stdlib.h>

char string[255];
char *root[255];
int i;

int syscall(char *flag,char *cmd){
    sprintf(string,"net %s %s",flag,cmd);
    system(string);
    return 0;
}

int service_handler(char *flag){
     char *cmd[4]={
        "wuauserv",
        "bits",
        "appidsvc",
        "cryptsvc"
    };
    i=0;
    while(i<4){
        syscall(flag,cmd[i]);
        i++;
    }
    return 0;
}

void backup(char *folder){
    *root=getenv("systemroot");
    sprintf(string,"move %s\\%s %s\\%s.old",*root,folder,*root,folder);
    system(string);
    printf(string);
}
void clean_create(char *folder){
    *root=getenv("systemroot");
    sprintf(string,"mkdir %s\\%s",*root,folder);
    system(string);
}
void cleanSys(){
    system("sfc /scannow");
    system("dism /online /cleanupimage /restorehealth");
}
void prep_system(){
    char *folders[2]={
        "SoftwareDistribution",
        "System32\\catroot2",
    };
    i=0;
    while(i<2){
        backup(folders[i]);
        clean_create(folders[i]);
        i++;
    }
    cleanSys();
    system("cleanmgr");
    system("cls");
    printf("Please Complete the Disk Cleanup");
    system("pause");
}

void stage_1(){
    service_handler("stop");
    prep_system();
}


int main(void){
    while(1){
        system("title Windows Update Fix!");
        printf("\n\t++++++++++ Windows Update Troubleshooter ++++++++++\n");
        printf("\n\n\t  ++++++++++ Created by Suman Roy ++++++++++\n\n");
        printf("|\tGithub Profile : https:\\\\www.github.com\\sumanrox\t|\n");
        printf("|\tNote : Run this application as administrator \t|\n");
        printf("\n[+] Press 1 to prepare system for windows update cleanup");
        printf("\n[+] Press 2 to Restart Services");
        printf("\n[+] Press 3 to Exit\n\n");
        int choice;
        scanf("%d",&choice);
        switch (choice)
        {
        case 1:
            system("cls");
            stage_1();
            break;
        case 2:
            system("cls");
            service_handler("start");
            system("cls");
            printf("All are now process running");
            system("pause");
            break;
        case 3:
            return 0;
            break;
        
        default:
            printf("Invalid Input! Try again\n");
            system("timeout /t 5 /NOBREAK");
            system("cls");
            break;
        }
    }
}