import requests


def test_storage():
  assert requests.get("http://reverse_proxy_node_local/storage/test.txt").text == "Storage 1"
  assert requests.get("http://reverse_proxy_node_local/storage/test/test.txt").text == "Storage 2"

def test_perso():
  assert requests.get("http://reverse_proxy_node_local/cv").text == "cv"
  assert requests.get("http://reverse_proxy_node_local/cv/lettre", auth=('user', 'password')).text == "lettre"
  assert requests.get("http://reverse_proxy_node_local/livres").text == "livres"
  assert requests.get("http://reverse_proxy_node_local/piano").text == "piano"

def test_finance():
  assert requests.get("http://reverse_proxy_node_local/finance", auth=('user', 'password')).text == "finance"
  assert requests.get("http://reverse_proxy_node_local/finance/account/Courant", auth=('user', 'password')).text == "Courant"
  assert requests.get("http://reverse_proxy_node_local/finance/max_date", auth=('user', 'password')).text == "max date"
  assert requests.delete("http://reverse_proxy_node_local/finance/transactions", auth=('user', 'password')).text == "delete transactions"
  assert requests.post("http://reverse_proxy_node_local/finance/transactions", auth=('user', 'password')).text == "post transactions"
  assert requests.put("http://reverse_proxy_node_local/finance/balances", auth=('user', 'password')).text == "put balances"
