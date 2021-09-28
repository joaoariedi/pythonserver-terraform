#!/usr/bin/python3
import json
import sys

from http.server import BaseHTTPRequestHandler, HTTPServer

import boto3
from botocore.exceptions import ClientError

instance_id = sys.argv[1]
region = sys.argv[2]
aws_access_key = sys.argv[3]
aws_secret_key = sys.argv[4]

ec2 = boto3.resource('ec2', region_name=region, aws_access_key_id=aws_access_key, aws_secret_access_key=aws_secret_key)
instance = ec2.Instance(instance_id)



# HTTPRequestHandler class
class testHTTPServer_RequestHandler(BaseHTTPRequestHandler):

    # GET
    def do_GET(self):
        try:
            if self.path.endswith("/tags"):
                #self.path has /tags
                self.send_response(200)
                self.send_header('Content-type','application/json')
                self.end_headers()

                tags = instance.tags

                # Send message back to client
                message = tags
                payload = bytes(json.dumps(message), 'utf-8')
                self.wfile.write(payload)
                return

            if self.path.endswith("/shutdown"):
                #self.path has /shutdown
                self.send_response(200)
                self.send_header('Content-type','application/json')
                self.end_headers()

                # Send message back to client
                message = bytes("shutting down", 'utf-8')
                self.wfile.write(message)
                instance.stop()
                return

        except IOError:
            self.send_error(404,'path not found: %s' % self.path)


def run():
    print('starting server...')

    # Server settings
    server_address = ('0.0.0.0', 80)
    httpd = HTTPServer(server_address, testHTTPServer_RequestHandler)
    print('running server...')
    httpd.serve_forever()

if __name__ == "__main__":
    run()
