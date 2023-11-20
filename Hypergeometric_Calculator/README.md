# Hypergeometric Calculator

This project offers a hypergeometric calculator tailored for card games. It's designed to determine the probabilities of drawing specific cards from a deck in a given scenario.

### Inputs
The calculator takes four input values:
- **Deck Size:** Total number of cards in the deck.
- **Number of Copies of Card:** Quantity of the particular card in the deck.
- **Cards Drawn:** Number of cards drawn from the deck.
- **Successes Wanted:** Desired number of specific cards to be drawn.

### Shiny App
I've developed a Shiny web application that implements this calculator interactively. Users can input their values and instantly obtain the probabilities they're seeking based on the hypergeometric distribution.

### Usage
To use the calculator:
1. Enter the values for deck size, number of card copies, cards drawn, and successes wanted.
2. Click the "Calculate" button to obtain the probabilities.
3. The app will display the probabilities for exact successes.

### Files Included
- `app.R`: R script containing the Shiny app code.
- `README.md`: Documentation explaining the project and its functionality.

### Requirements
To run the Shiny app, you'll need:
- R programming language installed.
- Shiny package installed (`install.packages("shiny")`).

### Running the App
1. Open `app.R` in RStudio or any R environment.
2. Run the app using the `runApp()` function.

### Future Improvements
Possible enhancements for the project might include:
- Incorporating additional statistical calculations or visualizations.
- Enhancing the user interface for a more intuitive experience.
