//TMDB 

const API_KEY = 'api_key=af53274b2a85eaa14516caf4b7e30ba9';
const BASE_URL = 'https://api.themoviedb.org/3';
const API_URL = BASE_URL + '/discover/movie?sort_by=popularity.desc&'+API_KEY;
const IMG_URL = 'https://image.tmdb.org/t/p/w500';
const searchURL = BASE_URL + '/search/movie?'+API_KEY;


const main = document.getElementById('main');
const form =  document.getElementById('form');
const search = document.getElementById('search');
const tagsEl = document.getElementById('tags');

const prev = document.getElementById('prev')
const next = document.getElementById('next')
const current = document.getElementById('current')


getMovies(API_URL);

function getMovies(url) {/*vai buscar os filmes todos do api consoante o url*/
	
  lastUrl = url;
    fetch(url).then(res => res.json()).then(data => {
        console.log(data.results)
        if(data.results.length !== 0){
            showMovies(data.results);
            

        }else{
            main.innerHTML= `<h1 class="no-results">No Results Found</h1>`
        }
       
    })

}


function showMovies(data) {/*mostra os videos*/
    main.innerHTML = '';

    data.forEach(movie => {
        const {title, poster_path, vote_average, overview, id} = movie;
		const val = valor.value;
        const movieEl = document.createElement('div');
        movieEl.classList.add('movie');
		
        movieEl.innerHTML = `
             <a href="adicionar_video.jsp?parametro=${val}&link=${poster_path}&rate=${vote_average}&descricao=${overview}&titulo=${title}"> <img src="${poster_path? IMG_URL+poster_path: "http://via.placeholder.com/1080x1580" }" alt="${title}"></a>
            <div class="movie-info">
                <h3>${title}</h3>
                <span class="${getColor(vote_average)}">${vote_average}</span>
            </div>
            <div >
               <br/> 
                <button class="know-more" id="${id}">Know More</button
            </div>
        
        `
	
        main.appendChild(movieEl);

        document.getElementById(id).addEventListener('click', () => {
          console.log(id)
          openNav(movie)
        })
    })
}






function getColor(vote) { /* mete o voto a cor */
    if(vote>= 8){
        return 'green'
    }else if(vote >= 5){
        return "orange"
    }else{
        return 'red'
    }
}

form.addEventListener('submit', (e) => { /* vai buscar os filmes consuante o que esta na caixa de texto posso fazer isto com o nome do film*/
    e.preventDefault();

    const searchTerm = search.value;


    if(searchTerm) {
        getMovies(searchURL+'&query='+searchTerm)
    }else{
        getMovies(API_URL);
    }

})
