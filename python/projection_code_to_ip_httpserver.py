#!/usr/bin/env python
# -*- coding: utf-8 -*-

# use TCPServer

import sys
import SocketServer
import os

class UrlHandler(SocketServer.BaseRequestHandler):
    def handle(self):
        request = self.request.recv(1024)

        print 'Request=' + request
        param = request.split(' ')[1].strip()

        if param == "/favicon.ico":
            return

        if len(param) == 1:
            self.request.sendall("This http server is for transforming projection code to ip\nIf you want get the ip of projection code 5d68j, enter the url http://10.101.72.10:8082/5d68j\nMake sure that the ip of your pc starts with 10")
            return

        param = param[1:]
        print 'param=' + param
  
        method = request.split(' ')[0]
        if method == 'GET':
            if len(param) != 5:
                self.request.sendall("projection code len is not 5")
                return

            box_ip = os.popen("java VerfCodeGenerator " + param).read()
            #self.request.sendall(text_content)
            self.request.sendall("box ip is " + box_ip)

        if method == 'POST':
            print 'POST'

if __name__ == '__main__':

    if len(sys.argv) != 2:
        print "param len is not 2"
        exit(0)

    port=(int)(sys.argv[1])
    server = SocketServer.TCPServer(('', port), UrlHandler)
    server.serve_forever()
