#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Start Flask backend on port 8000
cd "$SCRIPT_DIR/backend" && python app.py &
BACKEND_PID=$!

# Start frontend server on port 5000
cd "$SCRIPT_DIR" && python server.py &
FRONTEND_PID=$!

# Wait for both processes
wait $BACKEND_PID $FRONTEND_PID
