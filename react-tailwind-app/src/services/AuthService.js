const AuthService = {
    login: async (credentials) => {
        const response = await fetch('/api/auth.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                action: 'login',
                username: credentials.username,
                password: credentials.password
            })
        });
        return await response.json();
    },
    
    register: async (userData) => {
        const response = await fetch('/api/auth.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                action: 'register',
                username: userData.username,
                password: userData.password,
                email: userData.email
            })
        });
        return await response.json();
    },
    
    logout: async () => {
        const response = await fetch('/api/auth.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                action: 'logout'
            })
        });
        return await response.json();
    },
    
    checkAuth: async () => {
        const response = await fetch('/api/auth.php?action=check');
        return await response.json();
    }
};