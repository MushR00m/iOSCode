//
//  main.m
//  CUP大小端
//
//  Created by chen cheng on 14-9-23.
//  Copyright (c) 2014年 chen cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <netdb.h>
#include <arpa/inet.h>
#include <sys/socket.h>



/*struct hostent
{
    char	*h_name;	 //主机的正式名称
    char	**h_aliases;	//别名列表：保存的是一个指针数组的第一个元素的地址、指针数组的每一个指针指向的是一个别名、指针数组的最后一个元素等于NULL
    int	h_addrtype;	// 地址的类型
    int	h_length;	// 地址的长度
    char	**h_addr_list;	// 地址列表: 保存的是一个指针数组的第一个元素的地址、指针数组的每一个指针指向的是一个网络字节序的ip地址、指针数组的最后一个元素等于NULL
};

//头域名去获取主机信息   非线程安全的
struct hostent * gethostbyname(const char *name);*/



/**
 *  打开一个连接服务器的客户端的TCP套接字
 *
 *  @param hostName 服务端的域名
 *  @param port  服务端的端口
 *
 *  @return 大于等于表示创建成功、否则失败。
 */
int openClientSocket(char *hostName, uint16_t port)
{
    struct hostent *host = gethostbyname(hostName);
    if (host == NULL)
    {
        return -1;
    }
    
    if (host->h_addr_list[0] == NULL)
    {
        return -1;
    }
    
    int socketfd = socket(AF_INET, SOCK_STREAM, 0);
    if (socketfd < 0)
    {
        perror("socket err");
        return 0;
    }

    
    struct sockaddr_in severAddr;
    severAddr.sin_family = AF_INET;
    memcpy(&(severAddr.sin_addr.s_addr), host->h_addr_list[0], host->h_length);
    severAddr.sin_port = htons(port);
    
    
    int ret = connect(socketfd, (struct sockaddr *)&severAddr, sizeof(severAddr));
    if (ret < 0)
    {
        perror("connect err");
        close(socketfd);
        return -1;
    }
    
    return socketfd;
}





int main(int argc, const char * argv[])
{
   /* struct hostent *host1 = NULL;

    host1 = gethostbyname("www.baidu.com");
    if (host1 == NULL)
    {
        NSLog(@"查询失败");
        return 0;
    }
    NSLog(@"%s", host1->h_name);
    
    
    for (int i = 0;
         host1->h_aliases[i] !=  NULL;
         i++)
    {
        NSLog(@"别名:%s", host1->h_aliases[i]);
    }
    
    for (int i = 0;
         host1->h_addr_list[i] !=  NULL;
         i++)
    {
        char   ipstr[50];
        inet_ntop(host1->h_addrtype, host1->h_addr_list[i], ipstr, sizeof(ipstr));
        
        NSLog(@"IP地址:%s", ipstr);
    }
    */
    
    int socketfd = openClientSocket("www.1000phone.com", 80);
    
     NSLog(@"socketfd = %d", socketfd);
    
    
    
    return 0;
}

