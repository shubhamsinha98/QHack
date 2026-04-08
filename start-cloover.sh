#!/bin/zsh

cd "/Users/shubhamsinha/Documents/New project" || exit 1

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

if [ ! -f ".env" ]; then
  echo "Missing .env file. Create /Users/shubhamsinha/Documents/New project/.env first."
  exit 1
fi

npm run dev -- --host 127.0.0.1 &
SERVER_PID=$!

cleanup() {
  kill $SERVER_PID 2>/dev/null
}

trap cleanup EXIT INT TERM

for _ in {1..30}; do
  if curl -s http://127.0.0.1:5173 >/dev/null 2>&1; then
    open "http://127.0.0.1:5173"
    wait $SERVER_PID
    exit $?
  fi
  sleep 1
done

echo "Cloover did not start in time. Check the terminal output above."
wait $SERVER_PID
