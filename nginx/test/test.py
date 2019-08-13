import requests
import unittest


class NginxTest(unittest.TestCase):
  def test_can_access_app1(self):
    r = requests.get("http://nginx_local/app1/")
    self.assertEqual(r.text.strip(), "Hello World App1!")

  def test_can_access_app2(self):
    r = requests.get("http://nginx_local/app2/")
    self.assertEqual(r.text.strip(), "Hello World App2!")


if __name__ == "__main__":
  unittest.main()