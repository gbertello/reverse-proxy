CWD=$(cd $(dirname $0) && pwd)

echo "Testing app1"
$CWD/app1/test.sh
echo ""

echo "Testing app2"
$CWD/app2/test.sh
echo ""

echo "Testing nginx"
$CWD/nginx/test.sh
echo ""
