CWD=$(cd $(dirname $0) && pwd)

SYSTEM="dev"
while getopts ":s:" option; do
  case "${option}" in
    s)
      SYSTEM=${OPTARG}
      ;;
  esac
done

echo "Stopping nginx"
$CWD/nginx/stop.sh -s $SYSTEM
echo ""

