# TaskApp Frontend

This directory contains the frontend application for the TaskApp DevOps CI/CD Platform.

The application is built using React, TypeScript, Vite, and Tailwind CSS and provides a modern task management interface that integrates with the TaskApp Backend API.

The frontend is designed to run within a production-ready DevOps environment and is deployed using infrastructure provisioned with Terraform and configured using Ansible.

---

## Overview

The frontend application allows authenticated users to:

- Register and log in securely
- Manage tasks using a Kanban board
- Create, update, and delete tasks
- Persist authentication sessions
- Communicate securely with the backend API

The application follows modern frontend architecture patterns including reusable components, centralized API services, route protection, and global authentication state management.

---

## Features

### Authentication

- User registration
- User login
- JWT-based authentication
- Protected routes
- Session persistence

### Task Management

- Kanban Board Interface
- Task Creation
- Task Editing
- Task Deletion
- Task Status Management

Supported task states:

- To Do
- In Progress
- Done

Task priorities:

- Low
- Medium
- High

### User Experience

- Responsive Design
- Modern UI Components
- Error Handling
- Loading States
- Reusable Component Architecture

---

## Technology Stack

### Frontend

- React
- TypeScript
- Vite
- React Router
- Tailwind CSS

### Development Tools

- ESLint
- TypeScript
- npm

### Deployment

- Nginx
- AWS EC2
- GitHub Actions
- Ansible

---

## Architecture Overview

```text
User Interface
      │
      ▼
Pages & Routes
      │
      ▼
Authentication Context
      │
      ▼
API Service Layer
      │
      ▼
Backend API
```

### Design Principles

- Component Reusability
- Separation of Concerns
- Centralized API Communication
- Route Protection
- Environment-Based Configuration

---

## Project Structure

```text
taskapp_frontend_cicd/
├── src
│   ├── components/
│   ├── contexts/
│   ├── pages/
│   ├── services/
│   ├── types/
│   ├── App.tsx
│   ├── main.tsx
│   └── index.css
├── index.html
├── package.json
├── vite.config.ts
├── tailwind.config.js
└── eslint.config.js
```

---

## Authentication Flow

1. User submits credentials
2. Frontend sends request to backend API
3. Backend validates credentials
4. JWT token is returned
5. Token is stored locally
6. Protected routes become accessible

Example:

```http
Authorization: Bearer <JWT_TOKEN>
```

---

## API Integration

All API communication is centralized in:

```text
src/services/api.ts
```

Responsibilities include:

- Authentication requests
- Task management requests
- JWT token handling
- Error handling
- API configuration

---

## Environment Variables

Example:

```env
VITE_API_URL=http://localhost:5000/api
```

### Required Variables

| Variable | Purpose |
|-----------|----------|
| VITE_API_URL | Backend API URL |

---

## Local Development

### Install Dependencies

```bash
npm install
```

### Start Development Server

```bash
npm run dev
```

Application URL:

```text
http://localhost:5173
```

---

## Build Application

### Create Production Build

```bash
npm run build
```

### Preview Production Build

```bash
npm run preview
```

Build artifacts are generated in:

```text
dist/
```

---

## Code Quality

### Run Linting

```bash
npm run lint
```

### Run Type Checking

```bash
npm run typecheck
```

---

## CI/CD Integration

The frontend application is designed to be integrated into automated deployment workflows.

Deployment infrastructure includes:

- AWS EC2
- Nginx
- GitHub Actions
- Terraform
- Ansible

The application can be built automatically and deployed as part of a complete DevOps pipeline.

---

## Security Considerations

The application implements:

- JWT Authentication
- Protected Routes
- Centralized API Access
- Environment-Based Configuration

Additional production enhancements may include:

- Refresh Tokens
- HttpOnly Cookies
- CSP Headers
- Advanced Session Management

---

## Future Improvements

- Real-time task updates
- Role-Based Access Control (RBAC)
- Task assignment
- WebSocket integration
- Audit logging
- End-to-end testing
- Docker containerization
- Kubernetes deployment

---

## Author

**Anthony Chidi**

*DevOps Engineer | Cloud Engineer | CI/CD & Infrastructure Automation*
