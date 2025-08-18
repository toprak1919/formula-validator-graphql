# Formula Validator

A robust mathematical formula validation system with dual-engine architecture, real-time syntax checking, and comprehensive error detection. Features synchronized JavaScript and .NET validation engines for consistent results across frontend and backend.

## 🚀 Quick Start

### Standalone Version (No Installation)
```bash
# Simply open in browser
open index.html
```

### Full-Stack GraphQL Version

**Backend (.NET 8)**
```bash
cd backend/FormulaValidatorAPI
dotnet run
# GraphQL Playground: http://localhost:5000/graphql
```

**Frontend**
```bash
# Open the frontend interface
open frontend/index.html
```

## ✨ Key Features

- **🔄 Dual Validation Engines** - Synchronized JavaScript (frontend) and .NET (backend) validators
- **⚡ Real-time Validation** - Instant syntax checking with 300ms debounce
- **📊 Variable Support** - Measured values using `$variable` syntax
- **🔢 Constants Support** - Mathematical constants using `#constant` syntax
- **🎯 Smart Error Detection** - Typo suggestions using Levenshtein distance algorithm
- **🧪 Comprehensive Testing** - 60+ test cases with automated test runner
- **🚀 GraphQL API** - Modern API with interactive playground
- **📝 ACE Editor Integration** - Syntax highlighting and autocomplete
- **🐳 Docker Ready** - Containerized deployment support
- **☁️ Cloud Deployable** - Render, Koyeb, and Vercel configurations included

## 📐 Formula Syntax

### Basic Operations
```javascript
2 + 3           // Addition
5 - 2           // Subtraction  
4 * 3           // Multiplication
10 / 2          // Division
2 ^ 3           // Exponentiation
10 % 3          // Modulo
```

### Variables & Constants
```javascript
// Variables (measured values)
$temperature + $pressure
$measuredValue_1 * 2

// Constants (mathematical constants)
#pi * $radius ^ 2
#euler * $value

// Mixed expressions
($value1 + #constantA) * sqrt($value2)
```

### Supported Functions
```javascript
// Mathematical functions
sqrt(16)                      // Square root
pow(2, 8)                     // Power
abs(-5)                       // Absolute value

// Trigonometric
sin($angle * #pi / 180)       // Sine (with degree conversion)
cos($angle)                   // Cosine
tan($angle)                   // Tangent

// Logarithmic
log($value)                   // Natural logarithm
exp($value)                   // Exponential

// Utility functions
max($val1, $val2, $val3)      // Maximum value
min($val1, $val2)             // Minimum value
round($result, 2)             // Round to 2 decimal places
floor($value)                 // Round down
ceil($value)                  // Round up
```

## ✅ Validation Rules

| Rule | Example | Status |
|------|---------|--------|
| Balanced parentheses | `(a + b) * c` | ✅ Valid |
| No empty parentheses | `()` | ❌ Invalid |
| No trailing operators | `2 +` | ❌ Invalid |
| No double operators | `2 ++ 3` | ❌ Invalid |
| Valid variable syntax | `$temperature_1` | ✅ Valid |
| Valid constant syntax | `#pi` | ✅ Valid |
| Defined variables only | `$undefined` | ❌ Invalid |
| Functions need parentheses | `sqrt(16)` | ✅ Valid |

## 📁 Project Structure

```
.
├── 📄 index.html                      # Standalone single-file validator
├── 📁 backend/                        # .NET 8 Backend
│   ├── 📁 FormulaValidatorAPI/        # Main API project
│   │   ├── 📁 GraphQL/                # GraphQL mutations & queries
│   │   ├── 📁 Models/                 # Data models
│   │   ├── 📁 Services/               # Validation service
│   │   └── 📄 Program.cs              # Application entry point
│   └── 📁 FormulaValidatorAPI.Tests/  # Unit tests
│       └── 📄 FormulaValidationServiceTests.cs
├── 📁 frontend/                       # Web UI
│   ├── 📄 index.html                  # Main application
│   ├── 📄 config.js                   # API configuration
│   └── 📄 test-cases.json             # Test suite data
├── 📄 render.yaml                     # Render deployment config
├── 📄 Dockerfile                      # Container configuration
└── 📄 TECHNICAL-DOCUMENTATION.md      # In-depth technical docs
```

## 🧪 Testing

### Backend Unit Tests (.NET)
```bash
cd backend/FormulaValidatorAPI.Tests
dotnet test

# Run with coverage
dotnet test --collect:"XPlat Code Coverage"
```

### Frontend Test Suite
1. Open `frontend/index.html` in browser
2. Click **"Run Test Suite"** button
3. View automated test results for 60+ test cases

### Manual Testing
Use the GraphQL Playground at `http://localhost:5000/graphql` to test the API directly.

## 🔌 GraphQL API

### Validation Mutation
```graphql
mutation ValidateFormula($request: ValidationRequestInput!) {
  validateFormula(request: $request) {
    isValid
    error
    result
    evaluatedFormula
    source
  }
}
```

### Request Format
```json
{
  "request": {
    "formula": "sqrt($a^2 + $b^2)",
    "measuredValues": [
      {"id": "a", "name": "$a", "value": 3},
      {"id": "b", "name": "$b", "value": 4}
    ],
    "constants": [
      {"id": "pi", "name": "#pi", "value": 3.14159}
    ]
  }
}
```

### Response Format
```json
{
  "data": {
    "validateFormula": {
      "isValid": true,
      "error": null,
      "result": 5,
      "evaluatedFormula": "sqrt(3^2 + 4^2)",
      "source": "Backend"
    }
  }
}
```

## 🐳 Deployment

### Docker Deployment

**Build and Run**
```bash
# Backend only
cd backend
docker build -t formula-validator .
docker run -p 8000:8000 formula-validator

# Full stack with Docker Compose (if available)
docker-compose up
```

### Cloud Deployment Options

| Platform | Configuration | Notes |
|----------|--------------|-------|
| **Render** | `render.yaml` | Auto-deploy from GitHub |
| **Koyeb** | Root `Dockerfile` | One-click deploy |
| **Vercel** | Frontend only | Static site hosting |
| **Heroku** | `Procfile` needed | .NET buildpack required |
| **Azure App Service** | Built-in .NET support | Easy integration |

### Environment Variables

```bash
# Backend Configuration
PORT=5000                          # Server port
ASPNETCORE_ENVIRONMENT=Production  # Environment mode
ASPNETCORE_URLS=http://+:5000     # Binding URLs

# Frontend Configuration  
API_ENDPOINT=https://api.example.com/graphql  # Backend URL
```

## 🏗️ Architecture

### Dual Validation System

The Formula Validator employs a **synchronized dual-engine architecture**:

```
┌──────────────────────────────────────┐
│         Frontend (Browser)            │
│  ┌──────────────────────────────┐    │
│  │   Real-time Validation       │    │
│  │   • Math.js Parser           │    │
│  │   • expr-eval Engine         │    │
│  │   • Levenshtein Algorithm    │    │
│  └──────────────────────────────┘    │
│              ↓                        │
│  ┌──────────────────────────────┐    │
│  │   GraphQL Client             │    │
│  └──────────────────────────────┘    │
└──────────────┬───────────────────────┘
               │ HTTP/GraphQL
               ↓
┌──────────────────────────────────────┐
│         Backend (.NET 8)              │
│  ┌──────────────────────────────┐    │
│  │   GraphQL Server             │    │
│  │   (HotChocolate)             │    │
│  └──────────────────────────────┘    │
│              ↓                        │
│  ┌──────────────────────────────┐    │
│  │   Validation Service         │    │
│  │   • Regex Pattern Matching   │    │
│  │   • Function Whitelist       │    │
│  │   • Early Exit Optimization  │    │
│  └──────────────────────────────┘    │
└──────────────────────────────────────┘
```

### Validation Flow

1. **Input Phase**: User types formula in ACE Editor
2. **Frontend Validation**: Real-time syntax checking (300ms debounce)
3. **User Evaluation**: Click "Evaluate" button
4. **Backend Validation**: GraphQL mutation to .NET service
5. **Result Display**: Show backend result or fallback to frontend

## 💻 Development

### Prerequisites

| Requirement | Version | Purpose |
|------------|---------|---------|
| .NET SDK | 8.0+ | Backend development |
| Node.js | 14+ | Optional tooling |
| Docker | 20+ | Containerization |
| Git | 2.0+ | Version control |

### Local Development Setup

```bash
# Clone repository
git clone https://github.com/yourusername/formula-validator.git
cd formula-validator

# Backend setup
cd backend/FormulaValidatorAPI
dotnet restore
dotnet run

# Frontend setup (separate terminal)
cd frontend
# Open index.html in browser or use a local server
python -m http.server 8080
```

### Development Tools

- **VS Code** - Recommended IDE with C# and JavaScript extensions
- **Visual Studio** - Full .NET development experience
- **GraphQL Playground** - Interactive API testing at `/graphql`
- **Browser DevTools** - Frontend debugging and network monitoring

## 🤝 Contributing

Contributions are welcome! Please follow these guidelines:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Code Style
- **C#**: Follow .NET conventions
- **JavaScript**: Use ES6+ features
- **Comments**: Add JSDoc for functions
- **Tests**: Include unit tests for new features

## 📚 Documentation

- [Technical Documentation](TECHNICAL-DOCUMENTATION.md) - In-depth technical details
- [API Reference](backend/README.md) - Backend API documentation
- [Frontend Guide](frontend/README.md) - Frontend architecture

## 📄 License

This project is open source and available under the MIT License.

## 🙏 Acknowledgments

- **ACE Editor** - Code editing component
- **Math.js** - Expression parsing
- **HotChocolate** - GraphQL server
- **expr-eval** - Expression evaluation




