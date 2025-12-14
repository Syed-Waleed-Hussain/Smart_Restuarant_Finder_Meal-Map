/**
 * Star Rating Component
 * Reusable component for displaying and interacting with star ratings
 */

class StarRating {
    /**
     * Create a star rating component
     * @param {object} options - Configuration options
     * @param {boolean} options.interactive - Whether stars are clickable (default: true)
     * @param {number} options.rating - Initial rating value (1-5)
     * @param {function} options.onChange - Callback when rating changes
     * @param {number} options.size - Star size in pixels (default: 24)
     */
    constructor(options = {}) {
        this.interactive = options.interactive !== undefined ? options.interactive : true;
        this.rating = options.rating || 0;
        this.onChange = options.onChange || (() => {});
        this.size = options.size || 24;
        this.hoverRating = 0;
    }

    /**
     * Render the star rating as HTML
     * @returns {string} HTML string
     */
    render() {
        const stars = [];
        for (let i = 1; i <= 5; i++) {
            const filled = i <= (this.hoverRating || this.rating);
            const starClass = filled ? 'star-filled' : 'star-empty';
            const interactiveClass = this.interactive ? 'star-interactive' : '';
            
            stars.push(`
                <span 
                    class="star ${starClass} ${interactiveClass}" 
                    data-rating="${i}"
                    style="font-size: ${this.size}px;"
                >
                    ${filled ? '★' : '☆'}
                </span>
            `);
        }
        
        return `<div class="star-rating">${stars.join('')}</div>`;
    }

    /**
     * Mount the component to a DOM element
     * @param {string|HTMLElement} target - Target element or selector
     */
    mount(target) {
        const element = typeof target === 'string' ? document.querySelector(target) : target;
        if (!element) {
            console.error('StarRating: Target element not found');
            return;
        }

        element.innerHTML = this.render();
        
        if (this.interactive) {
            const stars = element.querySelectorAll('.star');
            
            stars.forEach(star => {
                star.addEventListener('mouseenter', (e) => {
                    this.hoverRating = parseInt(e.target.dataset.rating);
                    this.updateDisplay(element);
                });
                
                star.addEventListener('click', (e) => {
                    this.rating = parseInt(e.target.dataset.rating);
                    this.onChange(this.rating);
                    this.updateDisplay(element);
                });
            });
            
            element.querySelector('.star-rating').addEventListener('mouseleave', () => {
                this.hoverRating = 0;
                this.updateDisplay(element);
            });
        }
    }

    /**
     * Update the visual display of stars
     * @param {HTMLElement} element - Container element
     */
    updateDisplay(element) {
        const stars = element.querySelectorAll('.star');
        stars.forEach((star, index) => {
            const i = index + 1;
            const filled = i <= (this.hoverRating || this.rating);
            star.textContent = filled ? '★' : '☆';
            star.className = `star ${filled ? 'star-filled' : 'star-empty'} ${this.interactive ? 'star-interactive' : ''}`;
        });
    }

    /**
     * Set the rating value
     * @param {number} value - New rating (1-5)
     */
    setRating(value) {
        this.rating = Math.max(0, Math.min(5, value));
    }

    /**
     * Get the current rating value
     * @returns {number} Current rating
     */
    getRating() {
        return this.rating;
    }

    /**
     * Static method to create a display-only rating
     * @param {number} rating - Rating to display
     * @param {number} size - Star size in pixels
     * @returns {string} HTML string
     */
    static display(rating, size = 20) {
        const stars = [];
        const fullStars = Math.floor(rating);
        const hasHalfStar = rating % 1 >= 0.5;
        
        for (let i = 1; i <= 5; i++) {
            if (i <= fullStars) {
                stars.push(`<span class="star star-filled" style="font-size: ${size}px;">★</span>`);
            } else if (i === fullStars + 1 && hasHalfStar) {
                stars.push(`<span class="star star-half" style="font-size: ${size}px;">★</span>`);
            } else {
                stars.push(`<span class="star star-empty" style="font-size: ${size}px;">☆</span>`);
            }
        }
        
        return `<span class="star-rating">${stars.join('')}</span>`;
    }
}

window.StarRating = StarRating;

if (typeof module !== 'undefined' && module.exports) {
    module.exports = StarRating;
}
