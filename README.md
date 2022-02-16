# Flix

Flix is an app that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

## Flix Part 2

### User Stories

#### REQUIRED (10pts)
- [X] (5pts) User can tap a cell to see more details about a particular movie.
- [X] (5pts) User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.

#### BONUS
- [ ] (2pts) User can tap a poster in the collection view to see a detail screen of that movie.
- [ ] (2pts) In the detail view, when the user taps the poster, a new screen is presented modally where they can view the trailer.

### App Walkthrough GIF

<img src="flix-part2.gif" width=250><br>

### Notes
Added the backdrop image after the original movie poster, so the movie poster was cut off. Took me a good bit before I figured out that I needed to add them in the reverse order in order for it to work properly

---

## Flix Part 1

### User Stories

#### REQUIRED (10pts)
- [X] (2pts) User sees an app icon on the home screen and a styled launch screen.
- [X] (5pts) User can view and scroll through a list of movies now playing in theaters.
- [X] (3pts) User can view the movie poster image for each movie.

#### BONUS
- [ ] (2pt) User can view the app on various device sizes and orientations.
- [ ] (1pt) Run your app on a real device.

### App Walkthrough GIF

<img src="/flix-app.gif" width=250><br>

### Notes
Challenges:  
Thought I was supposed to do lab before the assignment first. Also accidentally put tableView.delegate = self, and tableView.dataSource = self at the end of the viewDidLoad function instead of the beginning.  
Also, I couldn't figure out how to get the project to show up properly, so it's just a folder inside of a larger git repo.  
I'm pretty dumb.
