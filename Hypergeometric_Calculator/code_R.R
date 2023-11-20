# Function to calculate hypergeometric probability
hypergeom_prob <- function(deck_size, num_copies_interest, cards_drawn, successes_wanted) {
  # Calculate the probability
  prob <- dhyper(successes_wanted, num_copies_interest, deck_size - num_copies_interest, cards_drawn)
  return(prob)
}

# Example usage
deck_size <- 60 # Total cards in the deck
num_copies_interest <- 2 # Number of copies of the card of interest
cards_drawn <- 7 # Number of cards drawn
successes_wanted <- 1 # Number of successes (e.g., number of specific cards you want)

# Calculate probability of getting exactly 'successes_wanted' number of the card of interest
prob <- hypergeom_prob(deck_size, num_copies_interest, cards_drawn, successes_wanted)
print(paste("Probability of getting exactly", successes_wanted, "of the card:", prob*100))
