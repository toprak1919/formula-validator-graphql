# Koyeb Deployment Guide

## Step 1: Sign up for Koyeb
1. Go to [app.koyeb.com](https://app.koyeb.com)
2. Sign up with GitHub (recommended) or email
3. No credit card required for free tier

## Step 2: Deploy Backend API

### Via Koyeb Web UI:
1. Click **"Create App"**
2. Select **"GitHub"** as deployment method
3. Connect your GitHub account and select `toprak1919/formula-validator-graphql`
4. Configure deployment:
   - **Branch**: `main`
   - **Builder**: Dockerfile
   - **Dockerfile path**: `backend/Dockerfile`
   - **Working directory**: `backend`
   - **Service name**: `formula-validator-api`
   - **Instance type**: Free (0.1 CPU, 512MB RAM)
   - **Region**: Choose closest to you
   - **Port**: 8000 (auto-detected)
   
5. Click **"Deploy"**
6. Wait 3-5 minutes for build and deployment
7. Your API will be available at: `https://formula-validator-api-<your-username>.koyeb.app/graphql`

## Step 3: Deploy Frontend

### Option A: Deploy on Koyeb as Static Site
1. Click **"Create Service"** in your app
2. Select same GitHub repo
3. Configure:
   - **Service name**: `formula-validator-frontend`
   - **Builder**: Static
   - **Build command**: `echo "No build needed"`
   - **Static files directory**: `frontend`
   - **Port**: 8000

### Option B: Deploy on Vercel (Recommended for frontend)
```bash
cd frontend
npx vercel
```

## Step 4: Update Frontend Configuration

1. After backend is deployed, get your API URL from Koyeb dashboard
2. Update `frontend/config.js`:

```javascript
const API_CONFIG = {
    DEVELOPMENT_URL: 'http://localhost:5000/graphql',
    PRODUCTION_URL: 'https://formula-validator-api-<your-username>.koyeb.app/graphql'
};
```

3. Commit and push:
```bash
git add frontend/config.js
git commit -m "Update API URL for Koyeb deployment"
git push
```

4. Koyeb will auto-redeploy with new configuration

## Step 5: Test Your Deployment

1. **Test Backend GraphQL Playground**: 
   - Visit: `https://formula-validator-api-<your-username>.koyeb.app/graphql`
   
2. **Test Frontend**:
   - Visit your frontend URL
   - Try validating formulas

## Koyeb Free Tier Benefits
- ✅ 1 app free forever
- ✅ No cold starts (always running)
- ✅ 512MB RAM, 0.1 vCPU
- ✅ Auto-deploy on git push
- ✅ Custom domains supported
- ✅ HTTPS included

## Troubleshooting

### Backend not starting?
- Check Koyeb logs in dashboard
- Ensure PORT environment variable is used (already configured in Dockerfile)

### Frontend can't reach backend?
- Verify CORS is enabled in backend
- Check API URL in config.js matches your Koyeb backend URL

### Need to redeploy?
- Push any change to GitHub
- Or click "Redeploy" in Koyeb dashboard

## Environment Variables (if needed)
In Koyeb dashboard → Service → Settings → Environment variables:
- `ASPNETCORE_ENVIRONMENT`: `Production`
- Port is automatically set by Koyeb