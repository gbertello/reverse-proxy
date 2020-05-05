import os
import requests


def test_main():
  r = requests.get("http://%s:80/app1/" % (os.getenv("IMAGE").replace("pytest", "test"))).text.strip()
  assert r == "Hello World App1!"
