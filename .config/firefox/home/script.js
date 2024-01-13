function time() {
    const newDate = new Date()
    const formatedDate = newDate.toLocaleString('en-US', { hour: 'numeric', minute: 'numeric', hour12: true })
    const hour = document.getElementById('hour')

    hour.innerHTML = formatedDate.replace(/:/g, '<span class="blink">:</span>');
}

function date() {
    const newDate = new Date()
    const dayOfMonth = newDate.toLocaleDateString('pt-BR')
    const date = document.getElementById('date')

    date.innerHTML = dayOfMonth
}

/* https://theysaidso.com/user/subscriptions
async function getQuote() {
    const apiKey = 'BSyttsZZJ0wGJ3dm24BLEI6Ab5ZeCZOV61DdhyRe';
    const apiUrl = `http://quotes.rest/qod.json?category=inspire&api_key=${apiKey}`;

    try {
        const response = await fetch(apiUrl);
        const data = await response.json();
        const quoteElement = document.getElementById('quote');

        quoteElement.textContent = data.contents.quotes[0].quote;
    } catch (error) {
        console.error('Erro ao obter citação:', error);
    }
}
*/

function quoteElement() {
    const quote = document.getElementById('quote')
    quote.innerHTML = "'And i'm not here to be the savior you long for, only the one you don't.'"
}

function darkTheme() {
    return window.matchMedia && window.matchMedia('(prefers-color-scheme: dark').matches
}

function updateFavicon() {
    const favicon = document.getElementById('favicon')

    if (darkTheme()) {
        favicon.href = 'icons/homewhite.ico'
    }else {
        favicon.href = 'icons/homeblack.ico'
    }
}

window.addEventListener("load", functionLoader, true); function functionLoader(){
    time()
    date()
    updateFavicon()
    quoteElement()
}

setInterval(time, 1000)

