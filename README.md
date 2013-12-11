# The Git Game

## Temporary Links

- [Notes](https://docs.google.com/a/elementaltechnologies.com/document/d/1fmAEsnFNizW7_NHXXLiRp4l0VyQpGWPvsFCAZzsrBCM/edit)
- [Rules](https://docs.google.com/a/elementaltechnologies.com/document/d/1un28PxXGdCHih5cI_m1a5xPwBJrTAXLN3qvdmOEkwoA/edit)
- [Feature Card Spreadsheet](https://docs.google.com/a/elementaltechnologies.com/spreadsheet/ccc?key=0AsDelZZ75dXvdFFVV2lRV3hQTGtoRWcwMHFqVHY5NVE&usp=sharing#gid=0)
- [Presentation](https://docs.google.com/a/elementaltechnologies.com/presentation/d/1tfpYc7mlG5RjarU2N7eCieb4zkBnLDMcqhZXxr6Dj-M/edit?usp=sharing)

## Overview

The Git Game was designed as a fun tool to help teach the basics of the git source control management (SCM) system. There are features and workflows unique to git that do not exist in some other SCMs and are not as heavily emphasized in others. It was made during an [Elemental Technologies][elemental] hackathon in December of 2013.

[elemental]: http://www.elementaltechnologies.com/

The Git Game is a game for up to 4 players in which you compete to implement the most features (measured in feature points) while trying not to get caught by bugs, feature creep, or merge conflicts.

TODO: Did we say up to 6 players?

## Supplies

The following supplies are required...

### Supplies: Cards

If you are printing this game yourself, you will need to print three copies of each of the Code card pages and two copies of the Action and Feature pages. Print the appropriate backs on each page. Only one copy of the Meta page is required. For best results, print on heavy cardstock and use the crop lines and a rotary cutter to trim the cards down to standard playing card size (2.5" x 3.5").

### Supplies: Tokens

Tokens are used to mark your branch location. Each player should have a pair of matching tokens, unique to that user. We found that [octocats][] manufactured on a 3D printer in different colors are the most fun, but coins or playing pieces pilfered from other games are perfectly acceptable.

[octocats]: http://www.thingiverse.com/thing:10367

### Supplies: Conflict Die

This is a single die with the 5 **Code Card** shapes on 5 faces and one blank face. We had a 3D-printed blank cube that we drew on. A more conventional method of achieving this is a regular 6-sided die with the following lookup table:

- 1 = circle
- 2 = star
- 3 = triangle
- 4 = square
- 5 = plus
- 6 = blank

## Game Elements

Here we take a deeper look at the parts and pieces...

### Elements: Cards

There are three types of cards: **Code Cards**, **Feature Cards**, and **Action Cards**.

**Code Cards** have a language and a shape. There are 5 languages (Ruby, JavaScript, C++, SQL, Python) and five shapes (circle, triangle, square, plus, star). **Code Cards** are played against a local **Feature card**, in an action known as a *commit*, to build out that feature.

**Feature Cards** have a list of (language) **Code Cards** required and a point value. To complete the feature (so that it may be merged back to master), you need to play cards of those languages in your local branch. 

**Action Cards** have different effects on gameplay:

- Bug (x8) "Play on a specific code card another player’s commit. This commit has a bug and must be discarded."
- git blame (x4) "You can use blame any time a “Bug” card is played against you. That bug must be passed to another player of your choosing. If no players have active commits, the bug is discarded."
- git bisect (x2) "You can use bisect any time a "Bug" card is played against you. Bisect quickly finds the source of the bug, counteracting the "Bug" card's action."
- git rebase (x4) "Use rebase to move your token to the tip of the code commits in Master."
- Caffeine | All-Nighter (x4) "Commit one extra code card."
- RTFM - I read the docs! (x2) "This card acts as a commit of any language. It will not cause any merge conflicts." This is, effectively, a **Code Card** and can be played as such.
- Feature Creep (x10) "Marketing has changed the requirements to require one additional [language] commit."

### Elements: Tokens

Each player has two matching tokens of the same color. When a player wishes to create a feature branch, one token is placed on the most recent card played on master (HEAD) and the other goes in front of the player on top of the feature card that player is developing (a symlink).

#Starting the Game

- Shuffle each deck of cards separately. Place the decks face down on the table. Leave room for a discard pile for each deck type.
- Each player takes one **Code Card** and one **Action Card**.
- Each player then draws three **Feature Cards**, selecting two to keep and discarding the third. The discarded features are shuffled back into the feature deck.
- After all the features are chosen, draw 4 code cards from the code deck and place them face up next to the code deck.
- Place the master branch  at one end of the table

#Order of play

Each player draws a **Feature Card**; the player who draws the highest point value goes first. In the event of a tie, the tied players re-draw until a higher card is drawn. The drawn cards are used solely for determining who goes first and should be placed in a Feature Card discard pile after being drawn.

This selects the first player. From there, turns proceed clockwise around the table.

#Turns

On a turn you can do the following in any order:

- Draw two **Code Cards**.  Draw any combination of the face-up or face-down cards. Face-down cards are replaced as soon as they are drawn.
- Play a **Feature Card**: create a branch.
    - The branch is created off the master card or the code most recently played on the master. Place one of your tokens on this card to mark where the branch came from.
    - Play the feature card in front of you and place the other of your matching tokens on it. This indicates the link between the branch and where it was branched from.
    - If the feature is small you may be able to complete it in this turn.
    - If it is large, which most of them are, you will take more than one turn.
    - You can't have more than 1 feature in progress at a time.
- Play up to two **Code Cards**, "committing" them to your local feature branch.
    - If it only takes 1 card to complete a feature, you can play the 2nd card on a new feature. Resolving a merge conflict doesn't count toward this limit.
    - If this completes a feature, then you can attempt to merge that back into master. See the following section for details on merging.
    - If the merge succeeds:
        - Draw a new **Feature Card**.
        - Draw an **Action Card**.
- Play up to one action card
    - You cannot play an action card on player that has a merge conflict

TODO: If people's hand sizes are getting out of control, add a max and make players discard above this max at the end of their turn.

#Merging features

When a feature meets its requirements (including any Feature Creep cards played upon it), it is complete. If any of the **Code Cards** ahead of your token on master has a shape which is in your feature branch, there is the chance for a merge conflict. The shape becomes a potentially conflicting shape for your commit. Roll the shape-die. If the shape that comes up matches one of the potentially conflicting shapes, you have a merge conflict in that shape. If the die comes up blank, reroll it. Turn a card in your commit with that shape sideways in your branch to indicate that the code has a merge conflict conflict that must be resolved. Your feature branch is frozen until you are able to resolve it.

TODO: House rules could decide the blank side: reroll, automatic no conflict, etc.

You must add (commit) one more code card with that shape (of any language) to your commit before you can merge it back. The additional code card doesn't add to the point total for the feature. If you have one in your hand, you can play it immediately, otherwise you must wait until you draw a card with a matching symbol. Resolving a conflicted merge doesn't count toward the maximum of playing two **Code Cards** ("commits") in your turn. Your conflicted branch is considered "code frozen" at this point. Opponents cannot play feature creep, bug, or other cards against it.

Option: if you have a rebase action card, you can rebase the token representing where your feature branch was branched from to the head of master to avoid any merge conflicts.  You must play the rebase card before rolling the die.

#End of game

When any player reaches 20 points, play ends after the last player in that round completes their turn.

At the conclusion of the game, players count up the point total of all their completed features, and the player with the highest point total wins.

#Example Round of Play

TODO: text here describing each turn...

![Initial Setup](https://raw.github.com/elementaltech/the-git-game/master/images/sample-play-1.png "Initial Setup")

(text here)

![Turn 1](https://raw.github.com/elementaltech/the-git-game/master/images/sample-play-2.png "Turn 1")

(text here)

![Turn 2](https://raw.github.com/elementaltech/the-git-game/master/images/sample-play-3.png "Turn 2")

(text here)

![Turn 3](https://raw.github.com/elementaltech/the-git-game/master/images/sample-play-4.png "Turn 3")

(text here)

![Turn 3 (continued)](https://raw.github.com/elementaltech/the-git-game/master/images/sample-play-5.png "Turn 3 (continued)")

(text here)

![Turn 4](https://raw.github.com/elementaltech/the-git-game/master/images/sample-play-6.png "Turn 4")

(text here)


## License

![Creative Commons License][cclogo]

[The Git Game][attr] by [Elemental Technologies][attr]</a> is licensed under a [Creative Commons Attribution-NonCommercial 4.0 International License][cc].

[cclogo]: http://i.creativecommons.org/l/by-nc/4.0/88x31.png
[attr]: http://www.elementaltechnologies.com/
[cc]: http://creativecommons.org/licenses/by-nc/4.0/



