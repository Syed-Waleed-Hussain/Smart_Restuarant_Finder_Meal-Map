/**
 * Shared Header Component
 * Provides consistent navigation across all pages with authentication state awareness
 * Supports 3-tier RBAC: user, vendor (owner), admin
 *
 * Mobile update: Hamburger / dropdown menu for screens < 768px.
 * - All existing auth logic, role checks, and onClick handlers are untouched.
 * - Toggle state is managed by a single CSS class on the <header> element.
 *   No framework or external library required.
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

    getRole() {
        if (!this.user) return null;
        const role = (this.user.Role || this.user.role || '').toLowerCase();
        // Normalize legacy 'owner' to 'vendor'
        if (role === 'owner') return 'vendor';
        return role;
    }

    isVendor() {
        const role = this.getRole();
        return role === 'vendor' || role === 'admin';
    }

    isAdmin() {
        return this.getRole() === 'admin';
    }

    getNavLinks() {
        const baseLinks = [
            { href: '/', text: 'Home', icon: '🏠' },
            { href: '/restaurants', text: 'Restaurants', icon: '🍽️' }
        ];

        if (!this.user) {
            return [
                ...baseLinks,
                { href: '/promotions', text: 'Promotions', icon: '🎉' },
                { href: '/login', text: 'Login', icon: '🔑' }
            ];
        }

        const role = this.getRole();
        const authLinks = [
            { href: '/promotions', text: 'Promotions', icon: '🎉' }
        ];

        if (role === 'user') {
            authLinks.push(
                { href: '/my-reservations', text: 'My Reservations', icon: '📅' },
                { href: '/favorites', text: 'Favorites', icon: '❤️' },
                { href: '/dashboard', text: 'Dashboard', icon: '👤' }
            );
        } else if (role === 'vendor') {
            authLinks.push(
                { href: '/my-reservations', text: 'My Reservations', icon: '📅' },
                { href: '/favorites', text: 'Favorites', icon: '❤️' },
                { href: '/owner-dashboard', text: 'Vendor Dashboard', icon: '🏪' },
                { href: '/dashboard', text: 'Dashboard', icon: '👤' }
            );
        } else if (role === 'admin') {
            authLinks.push(
                { href: '/my-reservations', text: 'My Reservations', icon: '📅' },
                { href: '/favorites', text: 'Favorites', icon: '❤️' },
                { href: '/owner-dashboard', text: 'Vendor Dashboard', icon: '🏪' },
                { href: '/admin-dashboard', text: 'Admin Panel', icon: '🛡️' },
                { href: '/dashboard', text: 'Dashboard', icon: '👤' }
            );
        }

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
        const lastName  = this.user.LastName  || this.user.last_name  || '';

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
        const lastName  = this.user.LastName  || this.user.last_name  || '';

        if (firstName && lastName) {
            return `${firstName} ${lastName}`;
        } else if (firstName) {
            return firstName;
        }

        return 'User';
    }

    getRoleBadge() {
        const role = this.getRole();
        if (role === 'admin')  return '<span style="background:#cc3333;color:white;padding:2px 8px;border-radius:4px;font-size:0.75rem;margin-left:0.5rem;">ADMIN</span>';
        if (role === 'vendor') return '<span style="background:#3d5a3a;color:white;padding:2px 8px;border-radius:4px;font-size:0.75rem;margin-left:0.5rem;">VENDOR</span>';
        return '';
    }

    logout() {
        if (this.api) {
            this.api.clearAuth();
        }
        window.location.href = '/login';
    }

    /**
     * Toggle hamburger open/close.
     * Called from the inline onclick on the hamburger button.
     * Adds/removes the CSS class 'nav-open' on the <header> element.
     */
    toggleMenu() {
        const header = document.querySelector('.app-header');
        if (header) {
            header.classList.toggle('nav-open');
        }
    }

    /**
     * Close the mobile menu.
     * Called when a nav link is clicked on mobile so the menu closes
     * after navigation (single-page links, or just for UX polish).
     */
    closeMenu() {
        const header = document.querySelector('.app-header');
        if (header) {
            header.classList.remove('nav-open');
        }
    }

    render() {
        const currentPath = this.getCurrentPath();
        const links = this.getNavLinks();

        // Build nav links — each one calls closeMenu() on click so the
        // dropdown closes after a tap on mobile. The existing href
        // navigation behaviour is completely unchanged.
        const navHTML = links.map(link => {
            const isActive = link.href === currentPath ||
                (link.href !== '/' && currentPath.startsWith(link.href));
            return `
                <a href="${link.href}"
                   class="${isActive ? 'active' : ''}"
                   onclick="window.appHeader.closeMenu()">
                    <span class="nav-link-icon">${link.icon}</span>
                    <span>${link.text}</span>
                </a>
            `;
        }).join('');

        // User menu — logout onclick is unchanged
        const userMenuHTML = this.user ? `
            <div class="user-menu">
                <span class="user-name">${this.getUserName()}${this.getRoleBadge()}</span>
                <div class="user-avatar" title="${this.getUserName()}">${this.getUserInitials()}</div>
                <button onclick="window.appHeader.logout()" class="btn-logout">
                    Logout
                </button>
            </div>
        ` : '';

        return `
            <header class="app-header" id="app-header">

                <!-- ── Logo (always visible) ── -->
                <a href="/" class="app-logo">🍽️ MealMap</a>

                <!-- ── Hamburger button (mobile only) ── -->
                <button
                    class="hamburger-btn"
                    aria-label="Toggle navigation menu"
                    aria-expanded="false"
                    id="hamburger-btn"
                    onclick="window.appHeader.toggleMenu(); this.setAttribute('aria-expanded', document.querySelector('.app-header').classList.contains('nav-open'))">
                    <span class="hamburger-bar"></span>
                    <span class="hamburger-bar"></span>
                    <span class="hamburger-bar"></span>
                </button>

                <!-- ── Nav links + user menu ── -->
                <nav class="app-nav" id="app-nav">
                    ${navHTML}
                    ${userMenuHTML}
                </nav>

            </header>

            <style>
                /* ════════════════════════════════════════════════════
                   HAMBURGER BUTTON
                   Visible only on mobile (≤ 768px)
                   ════════════════════════════════════════════════════ */
                .hamburger-btn {
                    display: none;           /* Hidden on desktop */
                    flex-direction: column;
                    justify-content: center;
                    align-items: center;
                    gap: 5px;
                    width: 40px;
                    height: 40px;
                    background: transparent;
                    border: 1.5px solid var(--color-border);
                    border-radius: var(--radius-sm);
                    cursor: pointer;
                    padding: 6px;
                    transition: border-color var(--transition-fast),
                                background var(--transition-fast);
                    flex-shrink: 0;
                }

                .hamburger-btn:hover {
                    border-color: var(--color-accent);
                    background: var(--color-cream);
                }

                .hamburger-bar {
                    display: block;
                    width: 20px;
                    height: 2px;
                    background: var(--color-text-primary);
                    border-radius: 2px;
                    transition: transform 0.3s ease, opacity 0.3s ease;
                    transform-origin: center;
                }

                /* ── Animate bars into an ✕ when menu is open ── */
                .app-header.nav-open .hamburger-btn .hamburger-bar:nth-child(1) {
                    transform: translateY(7px) rotate(45deg);
                }
                .app-header.nav-open .hamburger-btn .hamburger-bar:nth-child(2) {
                    opacity: 0;
                    transform: scaleX(0);
                }
                .app-header.nav-open .hamburger-btn .hamburger-bar:nth-child(3) {
                    transform: translateY(-7px) rotate(-45deg);
                }

                /* ════════════════════════════════════════════════════
                   NAV ICON (icon shown inside each mobile link)
                   Hidden on desktop to keep desktop look clean
                   ════════════════════════════════════════════════════ */
                .nav-link-icon {
                    display: none;
                    font-size: 1.1rem;
                    width: 1.6rem;
                    flex-shrink: 0;
                }

                /* ════════════════════════════════════════════════════
                   MOBILE OVERRIDES  (≤ 768px)
                   ════════════════════════════════════════════════════ */
                @media (max-width: 768px) {

                    /* Header row: logo left, hamburger right, on one line */
                    .app-header {
                        flex-direction: row !important;
                        align-items: center !important;
                        justify-content: space-between !important;
                        padding: 0.875rem var(--spacing-sm) !important;
                        flex-wrap: nowrap !important;
                        gap: 0 !important;
                        position: relative;  /* Anchor for dropdown */
                    }

                    /* Show hamburger */
                    .hamburger-btn {
                        display: flex;
                    }

                    /* Nav: hidden by default, shown as dropdown when .nav-open */
                    .app-nav {
                        display: none;
                        position: absolute;
                        top: 100%;           /* Drops right below the header bar */
                        left: 0;
                        right: 0;
                        background: var(--color-surface);
                        border-top: 1px solid var(--color-border-light);
                        border-bottom: 2px solid var(--color-accent);
                        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
                        flex-direction: column !important;
                        align-items: stretch !important;
                        gap: 0 !important;
                        padding: 0.5rem 0;
                        z-index: 999;
                        /* Smooth slide-down animation */
                        animation: slideDown 0.22s ease forwards;
                    }

                    @keyframes slideDown {
                        from { opacity: 0; transform: translateY(-8px); }
                        to   { opacity: 1; transform: translateY(0); }
                    }

                    /* Show the dropdown when nav-open is on header */
                    .app-header.nav-open .app-nav {
                        display: flex;
                    }

                    /* Nav links: full-width rows with icon */
                    .app-nav a {
                        display: flex !important;
                        align-items: center;
                        gap: 0.75rem;
                        padding: 0.875rem var(--spacing-sm);
                        border-bottom: 1px solid var(--color-border-light);
                        font-size: 0.95rem;
                        font-weight: 500;
                        color: var(--color-text-primary);
                        text-decoration: none;
                        transition: background var(--transition-fast),
                                    color var(--transition-fast);
                    }

                    .app-nav a:last-of-type {
                        border-bottom: none;
                    }

                    .app-nav a:hover {
                        background: var(--color-cream);
                        color: var(--color-accent);
                    }

                    .app-nav a.active {
                        color: var(--color-accent);
                        background: var(--color-cream);
                        border-left: 3px solid var(--color-accent);
                        padding-left: calc(var(--spacing-sm) - 3px);
                        font-weight: 600;
                    }

                    /* Show nav icons on mobile */
                    .nav-link-icon {
                        display: inline-block;
                    }

                    /* User menu: stacked inside the dropdown */
                    .user-menu {
                        flex-direction: column !important;
                        align-items: flex-start !important;
                        width: 100% !important;
                        padding: 0.875rem var(--spacing-sm);
                        border-top: 2px solid var(--color-border-light);
                        margin-top: 0.25rem;
                        gap: 0.5rem !important;
                    }

                    .user-name {
                        font-size: 0.9rem;
                    }

                    .btn-logout {
                        width: 100%;
                        text-align: center;
                        margin-top: 0.25rem;
                    }
                }

                /* ════════════════════════════════════════════════════
                   DESKTOP override — ensure nothing above breaks desktop
                   ════════════════════════════════════════════════════ */
                @media (min-width: 769px) {
                    .hamburger-btn {
                        display: none !important;
                    }

                    .app-nav {
                        display: flex !important;
                        position: static;
                        background: transparent;
                        border: none;
                        box-shadow: none;
                        flex-direction: row;
                        align-items: center;
                        gap: 2rem;
                        padding: 0;
                        animation: none;
                    }

                    /* Restore desktop link style */
                    .app-nav a {
                        padding: 0;
                        border: none;
                        background: transparent;
                    }

                    .app-nav a.active {
                        border-left: none;
                        padding-left: 0;
                        background: transparent;
                    }

                    .nav-link-icon {
                        display: none;
                    }

                    .user-menu {
                        flex-direction: row !important;
                        align-items: center !important;
                        width: auto !important;
                        padding: 0 !important;
                        border-top: none !important;
                        margin-top: 0 !important;
                        gap: var(--spacing-sm) !important;
                    }
                }
            </style>
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

        // Close menu if user clicks outside the header
        document.addEventListener('click', (e) => {
            const header = document.querySelector('.app-header');
            if (header && !header.contains(e.target)) {
                header.classList.remove('nav-open');
            }
        });
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
