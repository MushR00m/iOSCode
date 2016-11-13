//
//  main.m
//  demo
//
//  Created by chen cheng on 14-6-9.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>

#include <sys/types.h>
#include <sys/socket.h>
#include <ifaddrs.h>
#include <arpa/inet.h>

//获取处理的ip和掩码都是网路字节序
int getSubnetMask(uint32_t *ip, uint32_t *subnetMask)
{
    struct sockaddr_in *sin = NULL;
    
    struct ifaddrs *ifa = NULL;
    struct ifaddrs *ifList = NULL;
    
    int    flag = 0;
    
    if (getifaddrs(&ifList) < 0)
    {
        return -1;
    }
    
    for (ifa = ifList; ifa != NULL; ifa = ifa->ifa_next)
    {
        // printf("ifa->ifa_name = %s\n", ifa->ifa_name);
        
        if(ifa->ifa_addr->sa_family == AF_INET
           && strcmp(ifa->ifa_name, "en0") == 0)
        {
            sin = (struct sockaddr_in *)ifa->ifa_addr;
            //printf(">>> ipAddress: %s\n", inet_ntoa(sin->sin_addr));
            
            if (ip != NULL)
            {
                *ip = sin->sin_addr.s_addr;//本身是网络字节序
            }
            
            
            sin = (struct sockaddr_in *)(ifa->ifa_netmask);
            //printf(">>> subnetMask: %s\n", inet_ntoa(sin->sin_addr));
            
            if (subnetMask != NULL)
            {
                *subnetMask = sin->sin_addr.s_addr;//本身是网络字节序
            }
        
            flag = 1;
        }
    }
    
    freeifaddrs(ifList);
    
    if (flag)
    {
        return 0;
    }
    else
    {
        return -1;
    }
}


int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        uint32_t ip;
        uint32_t subnetMask;
    
        getSubnetMask(&ip, &subnetMask);
        
        //ip = ntohl(ip);
        //subnetMask = ntohl(subnetMask);
        
        char   ipStr[100];
        
        inet_ntop(AF_INET, &ip, ipStr, sizeof(ipStr));
        
        printf("ipStr = %s", ipStr);
        
        
        char   subnetMaskStr[100];
        inet_ntop(AF_INET, &subnetMask, subnetMaskStr, sizeof(subnetMaskStr));
        
        printf("subnetMaskStr = %s", subnetMaskStr);
        
        uint32_t netId = ip & subnetMask;
        uint32_t maxHostId = ~subnetMask;
        
        for (int i=1; i<maxHostId; i++)
        {
            uint32_t ip = netId + i;
            
            //法送UDP的 主机探测包
        }
        
    }
    return 0;
}

