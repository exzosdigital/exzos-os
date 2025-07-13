# 🌌 ExzosSphere - SaaS Development Framework

> **ExzosSphere** é o framework de desenvolvimento e boilerplate para criar novos módulos SaaS dentro do ecossistema ExzosOS.

## 🏗️ Arquitetura do Ecossistema

```
🌌 ECOSSISTEMA EXZOS
├── 🖥️  ExzosOS (CasaOS)           - Sistema Operacional Base
├── 🎯  ExzosVerce                 - Hub/Interface Principal  
└── ⚡  ExzosSphere (Framework)     - Boilerplate para Novos SaaS
    ├── 📦 Boilerplates
    ├── 🛠️  Development Tools
    └── 🎨 Cosmic Design System
```

## 🎯 Propósito

O **ExzosSphere** serve como:

- **Framework de Desenvolvimento** para novos módulos SaaS
- **Boilerplate Templates** pré-configurados
- **Design System Cósmico** unificado
- **Ferramentas de Development** padronizadas

## 📦 Módulos do Ecossistema

### 🌟 Core Modules

| Módulo | Descrição | Tipo | Status |
|--------|-----------|------|--------|
| **☀️ ExzosCore** | Infrastructure & Container Management | Infrastructure | ✅ |
| **🪐 ExzosVerse** | Multi-tenant AI Platform | AI Platform | ✅ |
| **🛰️ ExzosNexus** | Model Context Protocol Server | MCP Server | ✅ |
| **☄️ ExzosComet** | Job Processing Engine | Job Engine | ✅ |
| **📡 ExzosPulsar** | Multi-channel Notification System | Notifications | ✅ |
| **⭐ ExzosCluster** | Collection of Integrated Projects | Projects | ✅ |
| **🌠 ExzosAura** | Brand Assets & Design System | Design | ✅ |
| **📚 ExzosSpace** | Documentation & Knowledge Base | Docs | ✅ |

## 🛠️ Boilerplates Disponíveis

### 1. 🚀 NextJS SaaS
```bash
yarn create exzos-saas my-app --template=nextjs
```
- Next.js 15+ com App Router
- TypeScript + Tailwind CSS
- Autenticação (Supabase/Auth0)
- Billing (Stripe/LemonSqueezy)
- Design System Cósmico

### 2. 🔧 NestJS API
```bash
yarn create exzos-api my-api --template=nestjs
```
- NestJS com TypeScript
- Prisma/Drizzle ORM
- JWT Authentication
- Rate Limiting
- OpenAPI/Swagger

### 3. 📊 React Dashboard
```bash
yarn create exzos-dashboard my-dashboard --template=react
```
- React 18+ com Vite
- TanStack Query + Router
- Mantine/Ant Design
- Chart.js/Recharts
- Real-time updates

### 4. 📧 Notification Service
```bash
yarn create exzos-notifications my-service --template=notifications
```
- Multi-channel notifications
- Template management
- Provider integrations
- Queue system (Redis/Bull)

### 5. 🤖 AI Microservice
```bash
yarn create exzos-ai my-ai-service --template=ai
```
- OpenAI/Anthropic integration
- Vector database (Pinecone/Weaviate)
- Streaming responses
- Rate limiting & caching

### 6. ⚙️ Job Processor
```bash
yarn create exzos-jobs my-processor --template=jobs
```
- BullMQ/Agenda.js
- Cron scheduling
- Health checks
- Monitoring & alerts

## 🎨 Design System Cósmico

### Tema Principal
```css
:root {
  --cosmic-dark: #0a0a0f;
  --cosmic-purple: #6366f1;
  --cosmic-blue: #3b82f6;
  --cosmic-cyan: #06b6d4;
  --cosmic-gold: #f59e0b;
  --cosmic-silver: #6b7280;
}
```

### Componentes Base
- **Navigation**: Sidebar/Header cósmico
- **Cards**: Glassmorphism com tema espacial
- **Buttons**: Gradient cósmico
- **Forms**: Validação com feedback visual
- **Charts**: Visualizações temáticas

## 🚀 Quick Start

### 1. Instalar ExzosSphere CLI
```bash
npm install -g @exzos/sphere-cli
```

### 2. Criar Novo Projeto
```bash
exzos create my-saas --template=nextjs-saas
cd my-saas
```

### 3. Configurar Ambiente
```bash
# Instalar dependências
yarn install

# Configurar variáveis de ambiente
cp .env.example .env.local

# Iniciar desenvolvimento
yarn dev
```

### 4. Deploy
```bash
# Deploy para Railway/Vercel
exzos deploy --platform=railway

# Deploy para GCP
exzos deploy --platform=gcp
```

## 🔧 Configuração do Workspace

### Estrutura do Projeto
```
exzos-os/
├── packages/           # Módulos principais
│   ├── exzosverse/    # AI Platform
│   ├── exzosnexus/    # MCP Server
│   ├── exzoscomet/    # Job Engine
│   └── exzospulsar/   # Notifications
├── infrastructure/    # Docker & K8s
│   └── exzoscore/     # Infrastructure configs
├── assets/           # Brand & Design
│   └── exzosaura/    # Design system
├── docs/             # Documentation
│   └── exzosspace/   # Knowledge base
└── boilerplates/     # Development templates
    ├── nextjs-saas/
    ├── nestjs-api/
    ├── react-dashboard/
    ├── notification-service/
    ├── ai-microservice/
    └── job-processor/
```

## 🌐 Integração com Ecossistema

### ExzosOS (CasaOS)
- Container management
- Resource monitoring
- Network configuration
- Volume management

### ExzosVerce
- Central dashboard
- Module management
- Analytics & reporting
- User management

### Cloud Integrations
- **GCP**: Vertex AI, Cloud Run, Cloud SQL
- **Railway**: Database, Redis, API hosting
- **Vercel**: Frontend deployment, Edge functions

## 📚 Documentação

- **[Getting Started](./docs/getting-started.md)** - Primeiros passos
- **[API Reference](./docs/api-reference.md)** - Referência da API
- **[Design System](./docs/design-system.md)** - Sistema de design
- **[Deployment](./docs/deployment.md)** - Guias de deploy
- **[Examples](./docs/examples.md)** - Exemplos práticos

## 🤝 Contribuição

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/nova-feature`)
3. Commit suas mudanças (`git commit -am 'Add nova feature'`)
4. Push para a branch (`git push origin feature/nova-feature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

**🌌 Desenvolvido com ExzosSphere - Where Code Meets Cosmos**