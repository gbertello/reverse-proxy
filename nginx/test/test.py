import os
import requests


def test_app1():
  r = requests.get("http://%s:80/app1/" % (os.getenv("IMAGE").replace("pytest", "test"))).text.strip()
  assert r == "Hello World App1!"

def test_app2():
  r = requests.get("http://%s:80/app2/" % (os.getenv("IMAGE").replace("pytest", "test"))).text.strip()
  assert r == "Hello World App2!"
