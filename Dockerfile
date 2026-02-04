FROM python:3.11-slim

WORKDIR /app

# Install uv
RUN pip install --no-cache-dir uv

# Copy project files
COPY . .

# Install dependencies with uv
RUN uv pip install --system fastapi uvicorn sqlalchemy pydantic python-jose cryptography passlib argon2-cffi faker python-multipart

# Run the app
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
