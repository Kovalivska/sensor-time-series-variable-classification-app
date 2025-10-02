#!/bin/bash

# Script to run Variable Classification App
# Usage: ./run_app.sh

echo "🚀 Run Variable Classification App..."
echo "📍 Current directory: $(pwd)"
echo "🐍 Using Python: $(which python)"

# Change to the application directory
cd "$(dirname "$0")"

# Activate virtual environment and run Streamlit
source .venv/bin/activate
streamlit run app7.1_final.py

echo "✅ Application finished"
