/**
 * Shared Header Component
 * Provides consistent navigation across all pages with authentication state awareness
 */

class AppHeader {
    constructor() {
        // Use api-client.js as the single source of truth for auth state
        this.api = window.api || null;
    }

    get user() {
        return this.api ? this.api.getCurrentUser() : null;
    }

    get userId() {
        return this.api ? this.api.getCurrentUserId() : null;
    }

    isOwner() {
        // Check if user has 'owner' role
        if (!this.user) return false;
        const role = this.user.Role || this.user.role;
        return role === 'owner';
    }

    getNavLinks() {
        const baseLinks = [
            { href: '/', text: 'Home', icon: '🏠' },
            { href: '/restaurants', text: 'Restaurants', icon: '🍽️' }
        ];

        const authLinks = this.user ? [
            { href: '/my-reservations', text: 'My Reservations', icon: '📅' },
            { href: '/favorites', text: 'Favorites', icon: '❤️' },
            { href: '/promotions', text: 'Promotions', icon: '🎉' },
            ...(this.isOwner() ? [{ href: '/owner-dashboard', text: 'Owner Dashboard', icon: '🏪' }] : []),
            { href: '/dashboard', text: 'Dashboard', icon: '👤' }
        ] : [
            { href: '/promotions', text: 'Promotions', icon: '🎉' },
            { href: '/login', text: 'Login', icon: '🔑' }
        ];

        return [...baseLinks, ...authLinks];
    }

    getCurrentPath() {
        const path = window.location.pathname;
        if (path.endsWith('.html')) {
            return path.replace('.html', '');
        }
        return path === '/' ? '/' : path.replace(/\/$/, '');
    }

    getUserInitials() {
        if (!this.user) return '';

        const firstName = this.user.FirstName || this.user.first_name || '';
        const lastName = this.user.LastName || this.user.last_name || '';

        if (firstName && lastName) {
            return (firstName[0] + lastName[0]).toUpperCase();
        } else if (firstName) {
            return firstName.substring(0, 2).toUpperCase();
        } else if (this.user.Email || this.user.email) {
            const email = this.user.Email || this.user.email;
            return email.substring(0, 2).toUpperCase();
        }

        return 'U';
    }

    getUserName() {
        if (!this.user) return '';

        const firstName = this.user.FirstName || this.user.first_name || '';
        const lastName = this.user.LastName || this.user.last_name || '';

        if (firstName && lastName) {
            return `${firstName} ${lastName}`;
        } else if (firstName) {
            return firstName;
        }

        return 'User';
    }

    logout() {
        if (this.api) {
            this.api.clearAuth();
        }
        window.location.href = '/login';
    }

    render() {
        const currentPath = this.getCurrentPath();
        const links = this.getNavLinks();

        const navHTML = links.map(link => {
            const isActive = link.href === currentPath ||
                (link.href !== '/' && currentPath.startsWith(link.href));
            return `
                <a href="${link.href}" class="${isActive ? 'active' : ''}">
                    ${link.text}
                </a>
            `;
        }).join('');

        const userMenuHTML = this.user ? `
            <div class="user-menu">
                <span class="user-name">${this.getUserName()}</span>
                <div class="user-avatar" title="${this.getUserName()}">${this.getUserInitials()}</div>
                <button onclick="window.appHeader.logout()" class="btn-logout">
                    Logout
                </button>
            </div>
        ` : '';

        return `
            <header class="app-header">
             <a href="/" class="app-logo">🍽️ MealMap</a>
                <nav class="app-nav">
                    ${navHTML}
                    ${userMenuHTML}
                </nav>
            </header>
        `;
    }

    mount(targetSelector = 'body') {
        const target = document.querySelector(targetSelector);
        if (target) {
            const headerHTML = this.render();
            if (targetSelector === 'body') {
                target.insertAdjacentHTML('afterbegin', headerHTML);
            } else {
                target.innerHTML = headerHTML;
            }
        }
    }
}

window.appHeader = new AppHeader();

function initializeHeader(targetSelector = 'body') {
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', () => {
            window.appHeader.mount(targetSelector);
        });
    } else {
        window.appHeader.mount(targetSelector);
    }
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { AppHeader, initializeHeader };
}