/**
 * Toggle navigation menu for mobile view.
 */
function toggleMenu() {
    const menuToggle = document.getElementById('menuToggle');
    const navbarLinks = document.getElementById('navbarLinks');
    
    menuToggle?.addEventListener('click', () => {
      navbarLinks.classList.toggle('show');
    });
  }
  
  /**
   * Toggle between light and dark themes.
   */
  function toggleTheme() {
    const themeSwitcher = document.getElementById('themeSwitcher');
    
    themeSwitcher?.addEventListener('click', () => {
      document.body.classList.toggle('dark');
      themeSwitcher.textContent = document.body.classList.contains('dark')
        ? 'Light Mode'
        : 'Dark Mode';
    });
  }
  
  /**
   * Initialize all blog event listeners.
   * 
   * Notes:
   * - Call this after DOM content has fully loaded.
   */
  function initBlog(): void {
    toggleMenu();
    toggleTheme();
  }
  
  /* When the window loads, initialize event listeners */
  window.addEventListener('load', initBlog);
  