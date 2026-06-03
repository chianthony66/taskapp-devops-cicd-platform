# TaskApp Backend API

This directory contains the backend API for the TaskApp DevOps CI/CD Platform.

The application is built with Flask and PostgreSQL and provides secure authentication, task management functionality, and database persistence. It is designed to be deployed through an automated CI/CD pipeline running on AWS infrastructure provisioned with Terraform and configured using Ansible.

---

## Overview

The backend provides:

- User authentication and authorization
- JWT-based security
- Task management API
- PostgreSQL database integration
- Database migrations
- Automated testing
- CI/CD integration

The API serves as the core business logic layer of the TaskApp platform and is consumed by the React frontend application.

---

## Features

### Authentication

- User registration
- User login
- JWT token generation
- Token validation
- Password hashing

### Task Management

- Create tasks
- Retrieve tasks
- Update tasks
- Delete tasks

Task attributes include:

- Title
- Description
- Priority
- Status

### Backend Capabilities

- Flask Application Factory Pattern
- SQLAlchemy ORM
- Alembic Database Migrations
- Environment-Based Configuration
- CORS Support
- Automated Testing

---

## Technology Stack

### Backend

- Python
- Flask
- SQLAlchemy
- Alembic
- PostgreSQL

### Security

- JWT Authentication
- Werkzeug Password Hashing

### Testing

- Pytest

### Deployment

- GitHub Actions
- AWS EC2
- Ansible
- Nginx

---

## Architecture Overview

```text
Client Request
      │
      ▼
Flask API
      │
      ▼
Authentication Layer
      │
      ▼
Application Logic
      │
      ▼
SQLAlchemy ORM
      │
      ▼
PostgreSQL Database
```

### Design Principles

- Modular application structure
- Blueprint-based routing
- Environment-driven configuration
- Secure authentication
- Separation of concerns

---

## Project Structure

```text
taskapp_backend_cicd/
├── app/
│   ├── auth.py
│   ├── models.py
│   ├── routes.py
│   └── __init__.py
├── migrations/
├── tests/
├── requirements.txt
├── run.py
└── alembic.ini
```

---

## Authentication

Authentication is implemented using JSON Web Tokens (JWT).

### Login Flow

1. User submits credentials
2. Credentials are validated
3. JWT token is generated
4. Token is returned to the client
5. Client includes token in future requests

Example:

```http
Authorization: Bearer <JWT_TOKEN>
```

Protected routes require a valid token before access is granted.

---

## API Endpoints

### Authentication

#### Register User

```http
POST /api/auth/signup
```

#### Login User

```http
POST /api/auth/login
```

---

### Tasks

#### Get Tasks

```http
GET /api/tasks
```

#### Create Task

```http
POST /api/tasks
```

#### Update Task

```http
PUT /api/tasks/<id>
```

#### Delete Task

```http
DELETE /api/tasks/<id>
```

All task endpoints require authentication.

---

## Database Models

### User

| Field | Description |
|---------|-------------|
| id | User Identifier |
| username | Unique Username |
| password_hash | Encrypted Password |
| created_at | Creation Timestamp |

### Task

| Field | Description |
|---------|-------------|
| id | Task Identifier |
| title | Task Title |
| description | Task Description |
| priority | Task Priority |
| status | Task Status |
| created_at | Creation Timestamp |
| updated_at | Update Timestamp |

---

## Environment Variables

Create a local `.env` file:

```env
DATABASE_URL=postgresql://taskapp_user:password@localhost:5432/taskapp
SECRET_KEY=your_secret_key
PORT=5000
```

### Required Variables

| Variable | Purpose |
|-----------|----------|
| DATABASE_URL | PostgreSQL connection |
| SECRET_KEY | JWT signing key |
| PORT | Application port |

---

## Local Development

### Create Virtual Environment

```bash
python -m venv venv
source venv/bin/activate
```

### Install Dependencies

```bash
pip install -r requirements.txt
```

### Run Database Migrations

```bash
alembic upgrade head
```

### Start Application

```bash
python run.py
```

Application URL:

```text
http://localhost:5000
```

---

## Testing

Run tests using:

```bash
pytest
```

Test coverage includes:

- Authentication
- Task operations
- API endpoints

---

## CI/CD Integration

The backend is integrated into an automated GitHub Actions pipeline.

### Continuous Integration

Pipeline stages:

- Code Quality Checks
- Import Validation
- Security Scanning
- Automated Testing
- Artifact Creation

### Continuous Deployment

Following a successful CI run:

- Deployment artifacts are generated
- Artifacts are transferred to AWS EC2
- Application files are updated
- Services are restarted automatically

This enables automated deployments directly from GitHub to AWS.

---

## Security Considerations

The application implements:

- Password hashing
- JWT authentication
- Protected API routes
- Environment-based secrets
- Database access controls

Production environments should additionally implement:

- Token expiration
- Refresh tokens
- Rate limiting
- HTTPS enforcement
- Role-Based Access Control (RBAC)

---

## Future Improvements

- Docker containerization
- Kubernetes deployment
- Monitoring and alerting
- Centralized logging
- Blue-Green deployments
- API versioning

---

## Author

**Anthony Chidi**

*DevOps Engineer | Cloud Engineer | CI/CD & Infrastructure Automation*
