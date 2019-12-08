import requests


def test_app1():
  r = requests.get("http://reverse_proxy_nginx_local/app1/")
  assert r.text.strip() == "Hello World App1!"


def test_app2():
  r = requests.get("http://reverse_proxy_nginx_local/app2/")
  assert r.text.strip() == "Hello World App2!"
