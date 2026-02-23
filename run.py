"""
Production entrypoint for Cloud Run (or any host that sets PORT).
Preloads the model at startup, then serves the Flask app with Waitress on 0.0.0.0:PORT.
Avoids Werkzeug's host check (no 403) and listens on the port Cloud Run provides.
"""
import os

from application import application, load_model_impl

if __name__ == "__main__":
    load_model_impl()
    port = int(os.environ.get("PORT", 8080))
    import waitress
    waitress.serve(application, host="0.0.0.0", port=port)
