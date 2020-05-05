SYSTEM="dev"
while getopts ":s:" option; do
  case "${option}" in
    s)
      SYSTEM=${OPTARG}
      ;;
  esac
done

nginx/start.sh -s $SYSTEM