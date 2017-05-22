#!/usr/bin/python

import os, socket
import netifaces as ni
from jinja2 import Environment, FileSystemLoader, Template

CONFIG = "/etc/runner/config/"

def write_issue_file():
    ni.ifaddresses('ens33')
    ip = ni.ifaddresses('ens33')[2][0]['addr']
    #ip = "4.2.2.2" # for testing

    file_name = "/etc/issue"
    issue_runner_env = Environment(loader=FileSystemLoader(CONFIG))
    issue_runner_template = issue_runner_env.get_template("issue.j2")
    context = {
        "product_name": "AirWatch Service Monitor",
        "if_name": "ens33",
        "ip_addr": ip,
        "scheme": "http",
        "c_scheme": "https",
        "hostname": socket.gethostname(),
        "port": 8080
    }

    with open(file_name, 'w') as file:
        issue = issue_runner_template.render(context)
        file.write(issue)

write_issue_file()
