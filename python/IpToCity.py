'''
Created on 2012-8-29

@author: pengjun03
'''

# -*- coding: utf-8 -*-

import codecs
"""
ip到地址映射的切分程序
"""
def ip_to_address_agent(line):
    
    FIELDS_LEN = 8
    fields = {};
    
    line_arr = line.split("|")
    if (len(line_arr) != FIELDS_LEN):
        return None
    
    fields['start_ip'] = line_arr[0];
    
    temp_arr = line_arr[1].split(":")
    if (len(temp_arr) != 2):
        return None
    fields['end_ip'] = temp_arr[0]
    fields['country'] = temp_arr[1]
    
    fields['province'] = line_arr[2]
    fields['city'] = line_arr[3]
    fields ['county'] = line_arr[4]
    fields ['sp'] = line_arr[5]
    fields ['is_active'] = line_arr[6]
    fields ['other'] = line_arr[7]

    return fields

"""
比较两个ip地址大小：分四个区间，从头到尾，比较数字大小
"""
def compare_ip(ip1_arr, ip2_arr):
    
    for i in range(0,3):
        if(ip1_arr[i] != ip2_arr[i]):
            if(int(ip1_arr[i]) > int(ip2_arr[i])):
                return 1
            else:
                return -1
    return 0

"""
判断ip是否在一个ip区间中
"""
def ip_vs_ipInterval(ip, start_ip, end_ip):
    
    ip_arr = ip.split(".")
    start_ip_arr = start_ip.split(".")
    end_ip_arr = end_ip.split(".")
    
    if(len(ip_arr) != 4 or len(start_ip_arr) != 4 or len(end_ip_arr) != 4):
        return None
    
    print (ip_arr, start_ip_arr,end_ip_arr)
    if(compare_ip(ip_arr, start_ip_arr) >= 0 and compare_ip(ip_arr, end_ip_arr) <= 0 ):
            return 0
    elif(compare_ip(ip_arr, start_ip_arr) < 0):
            return -1
    elif(compare_ip(ip_arr, end_ip_arr) > 0):
            return 1


"""
查找ip对应的地址
"""
def find_ip_to_address(ip):
    
    global ip_to_address_arr
    
    start = 0
    end = len(ip_to_address_arr) - 1
    
    while start <= end :
        
        mid = int((start + end) / 2)
        fields = ip_to_address_agent(ip_to_address_arr[mid])
        
        if fields == None or ip_vs_ipInterval(ip, fields['start_ip'], fields['end_ip']) == None:
            return None
        
        #如果大于这个范围
        if(ip_vs_ipInterval(ip, fields['start_ip'],fields['end_ip']) > 0):
            start = mid + 1
        #如果小于这个范围
        elif (ip_vs_ipInterval(ip, fields['start_ip'], fields['end_ip']) < 0):
            end = mid - 1
        #如果在这个范围内
        else:
            return fields
        
    return None

"""
读入依赖文件
""" 
def read_ip_to_address(filename):
    
    ip_to_address_arr = []
    for line in codecs.open(filename, 'r', 'utf-8'):
        line = line.rstrip()
        if not line:
            continue
        ip_to_address_arr.append(line)
    
    return ip_to_address_arr

filename = "ip_to_address.txt"
ip = "116.37.55.255"
#ip = "172.128.0.0"
ip_to_address_arr = read_ip_to_address(filename)
#print len(ip_to_address_arr)
fields =  find_ip_to_address(ip)
print (fields)






#    fields = ip_agent(line)
#    
#    if fields == None:
#        raise "ip_to_address.txt is not available"
    
    
    
    
#    if(preFields != ""):
#        if(compare_ip(preFields['start_ip'], fields['start_ip'])):
#            print preFields['start_ip'] + " " + fields['start_ip']
#            print "error"
#            break
#    if c > 10:
#        break
#    c += 1
#    preFields = fields
    
    
    
    
    
    
    
    