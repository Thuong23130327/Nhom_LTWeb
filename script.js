const searchBar = document.querySelector('.searchBar');
const icon = document.querySelector('.searchBar i');

icon.addEventListener( 'click', () => {
    searchBar.classList.toggle('active');
});