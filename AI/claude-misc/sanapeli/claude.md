# Project: My word quessing game

## Project Description

Web browser game: Player will guess one secret Finnish word of the day. Each guess reveals where the word sits alphabetically. Game keeps track about the attempt count, and how long the player has been quessing the correct word. Word is randomly selected from a text file

## Tech Stack

- Frontend: Javascript in the web browser
- Database: Firebase for daily high scores

## Code Conventions, Filenames

- camelCase for source code variables and functions
- PascalCase for source code components and classes
- 4-space indentation
- all filenames are always lowercase

## Project Structure and Hosting

- Everything will be saved to the same project directory root
- Web application is self-hosted with existing Linux Apache web server with https connection

## Coding Style

- Always prefer short and clear solution. Do not overengineer
- Prioritize performance optimizations
- Prefer functional programming approach
- Comment the code shortly

## Boundaries

- **Ask first:** Before modifying existing markdown files
- **Never do:** Edit config files, commit secrets

## Initial Application Requirements

- Web application game with several views
- Responsive and works well with mobile, tablet and desktop web browsers
- Automatic light/dark mode depending on browser or operating system setting. Light mode is the default
- Game and all texts are in Finnish
- Select a random secret word from a text file sanat.txt in the same project directory. Don't show it to the player unless player enters a correct quess
- The landing web page contents:
  - User is shown basic instruction in Finnish. The instructions text is:"Arvaa oikea suomenkielinen sana mahdollimman nopeasti. Käytössä on kirjaimet A-Ö. Oikeassa sanassa on 4-12 kirjainta. Yhdysviivalla olevia sanoja ei ole."
  - Player nickname box with default text "Anonyymi"
  - Start button with text "Aloita peli". Start button starts the game
- When the game starts, open a new page showing:
  - Finnish alphabet:"A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, Å, Ä, Ö"
  - Player nickname
  - Timer with hours, minutes and seconds
  - How many quesses the player has entered so far
  - Input text box to quess a word of the day
- Playing and when player enters the quess:
  - Show the quessed word in the same screen
  - Allow player to keep quessing unless the quess is correct
  - Reorder the quessed words in the same screen
  - Keep a thin red line in the middle of quessed words, where the secret word will later be revealed when the player answers correctly. The line is shown only after the first quess
  - Increase the quess counter after each round
  - Timer runs in the screen
  - Check if the player entered word is listed in the sanat.txt file. If it's not, don't increase the counter and tell the player "En tunne tuollaista suomenkielistä sanaa!"
- When player quesses the correct word:
  - Stop the timer
  - Congratulate the player with text:"Onneksi olkoon \<nickname\>!", and show how many quesses the correct word required and how long it took. Present the result in a text box which can be easily copy pasted or added to a clipboard
