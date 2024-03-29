export RUST_BACKTRACE=1
# compile check
go build -o main.out || exit 1

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

runtest() {
  output=$(echo "$1" | time ./main.out)
  if [ "$output" != "$2" ]; then
    echo -e "${RED}fail"
    echo "input: $1"
    echo
    echo -e "$2 expected. but got $output${NC}"
  else
    echo -e "${GREEN}OK${NC}"
  fi
}

t() {
    runtest "$@"
}
