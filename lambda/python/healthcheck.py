# lambda/healthcheck.py
import json
from datetime import datetime

def handler(event, context):
    print(event)  # Log the incoming event for debugging
    print(context)  # Log the context for debugging
    return {
        "statusCode": 200,
        "headers": {
            "Content-Type": "application/json"
        },
        "body": json.dumps({
            "status": "healthy",
            "timestamp": datetime.now().isoformat(),
            "service": "arka-api"
        })
    }