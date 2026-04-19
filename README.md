# Analytics Ingestion Microservice

A Crystal-based microservice for ingesting and processing analytics events. This service provides secure API endpoints for tracking events, with built-in authentication and health checks.

## Version
0.2.0

## Features
- RESTful API for event tracking
- API key-based authentication
- Health check endpoint
- Modular architecture with separate controllers, middleware, and services
- Built with Kemal web framework

## Prerequisites
- Crystal >= 1.19.2 (latest stable recommended)
- Shards (Crystal's package manager)

## Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Event-Tacking-Project/analytics-ingestion.git
   cd analytics-ingestion
   ```

2. **Install dependencies:**
   ```bash
   shards install
   ```

3. **Build the application:**
   ```bash
   crystal build src/analytics-ingestion.cr
   ```

## Configuration

### Environment Variables
Set the following environment variables:

- `VALID_API_KEYS`: Comma-separated list of valid API keys (e.g., `key1,key2,key3`). Currently defaults to `["test_key_123"]` for development.

Example:
```bash
export VALID_API_KEYS="prod_key_123,test_key_456"
```

### Future Configuration
- Database connection (PostgreSQL planned)
- Redis connection for event publishing

## Running the Service

1. **Start the server:**
   ```bash
   ./analytics-ingestion
   ```

   The server will start on `http://localhost:3000` by default.

2. **Test the health endpoint:**
   ```bash
   curl -H "Authorization: Bearer test_key_123" http://localhost:3000/health
   ```

## API Endpoints

### Health Check
- **GET** `/health`
- **Description**: Returns service status
- **Authentication**: Required (API key)
- **Response**: `200 OK` with "OK - Up"

### Event Tracking
- **POST** `/track`
- **Description**: Ingests analytics events
- **Authentication**: Required (API key)
- **Body**: JSON payload with event data
- **Response**: `200 OK` on success

## Development

### Project Structure
```
src/
├── analytics-ingestion.cr    # Main entry point
├── config/
│   └── env.cr                 # Environment configuration
├── controllers/
│   └── track.controller.cr    # Event tracking logic
├── middleware/
│   └── auth.cr                # Authentication middleware
├── routes/
│   └── track.routes.cr        # Route definitions
└── services/
    └── apiKeyValidator.service.cr  # API key validation
```

### Running Tests
```bash
crystal spec
```

### Generating Documentation
```bash
crystal docs
```
Open `docs/index.html` in your browser.

### Code Style
- Follow Crystal community conventions
- Use `crystal tool format` for code formatting

## Dependencies
- **Kemal**: Web framework for Crystal
- **Crystal Standard Library**: Built-in HTTP and JSON support

See `shard.yml` for full dependency list.

## Contributing
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests
5. Submit a pull request

## License
Apache-2.0

## Roadmap
- Database integration (PostgreSQL)
- Redis event publishing
- Advanced authentication (project-based keys)
- Metrics and monitoring
- API versioning
