// Configuration for API endpoint
const API_CONFIG = {
    // For local development
    LOCAL_URL: 'http://localhost:5232/graphql',
    
    // For production - Update with your actual Render backend URL
    // Get this from your Render dashboard after deployment
    PRODUCTION_URL: 'https://formula-validator-api.onrender.com/graphql',
    
    // Automatically use production URL if not on localhost
    get URL() {
        return window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1'
            ? this.LOCAL_URL
            : this.PRODUCTION_URL;
    }
};