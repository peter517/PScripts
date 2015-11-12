#!/usr/bin/env python
# -*- coding: utf-8 -*-

# use TCPServer

import SocketServer
import os

HOST = ''
PORT = 8001

class UrlHandler(SocketServer.BaseRequestHandler):
    def handle(self):
        request = self.request.recv(1024)

        print 'Request=' + request
        param = request.split(' ')[1].strip()

        if param == "/favicon.ico":
            return

        if len(param) == 1:
            self.request.sendall("this http server is for transforming projection code to ip which starts with 10")
            return

        param = param[1:]
        print 'param=' + param
  
        method = request.split(' ')[0]
        if method == 'GET':
            if len(param) != 5:
                self.request.sendall("projection code len is 5")
                return

            box_ip = os.popen("java VerfCodeGenerator " + param).read()
            #self.request.sendall(text_content)
            self.request.sendall("box ip is " + box_ip)

        if method == 'POST':
            print 'POST'

server = SocketServer.TCPServer((HOST, PORT), UrlHandler)
server.serve_forever()
