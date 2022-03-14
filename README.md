# Marvel Comics 

![Marvel](app/assets/images/cover.jpeg)

### Description

Using the Marvel developer API ​ https://developer.marvel.com/​ , create a simple app that allows
the user to scroll through all the comics ever released from the most recent to the oldest (and
please, let us see the cover picture while at it!). The app should allow users to search by
character (eg. ​ deadpool ​ ) and allow the user to mark specific comics as favourites.
The assets to recreate the design can be found inside the `assets` folder.

### Requirements

1. When I open the page I want to see a list of all Marvel’s released comic books covers
ordered from most recent to the oldest
2. When I see the list of comics I want to be able to search by character (eg. ​ “deadpool”​ )
so I can find my favorite comics
3. When I see the list of comics I want to be able to upvote any of them so that the most
popular are easy to find in the future

### Solution

In this challenge, I've used **Rails 7** looking for the newest version and the last features, **PostgreSQL** was chosen as the database, mainly because i'ts a solid open source database (and it's used in the company stack). For the frontend was used, a simple combination of **HTML** and **CSS** supported by **Bootstrap 5**, one of the most used tool in front end development. The principal gem it was Device, who implemented the user authentication solution (used in a lot of big production applications). For the test suit, **Rspec** was the tool selected, because of the reliability and my previous experience. Although it is a small application, it was some interesting problems to solve, considering the context of the implementation.
  
  ​  Requirement 1:
  
  The first requirement it was responsible for the first page, basically it was made a request for the marvel API, searching for 20 comics based on released date. In this case, it was implemented a Comic parser, responsable to get the API raw response and transform into an array of comic objects. It's important to say that the comic model it was not persisted on database because there are thousands of comics in Marvel’s database. Inserting all comics into our database would take time, and it was not on challenge requirements. The index page it was cached using rails lower level cache techniques (avoiding unnecessary requests to marve's API and speeding the time to display the comics). Here I implemented a simple pagination schema made by scratch, mainly because the principal pagination gems didn't support well the not persisted models specifications.
 
 
  ​  Requirement 2:
  
  The search method was implemented doing an API request asking for the character ID, in this case, the Character model was not persisted too. After with the character's ID on hand, the comics structure it was reused to display all the comics made by the character chosen. Both requirements, explained, used the same partial responsible for display all the comics.
 
  
  ​  Requirement 3:
  
   The up vote requirement was implemented with a persisted model, who stored the current_user logged (got the devise helper) and the comic ID. With this information, it was possible to check if the comic has already been updated or no. It was implemented database indexes, considering a production capable solution, the tuples of up vote table could become huge after some time and a relative amount of users. On the front end, it was implemented a CSS with hover, so users could easily see witch here up voted. A great number of possibilities could be implemented in a continuation of this project, could be implemented a page with user's favorite comics, or an approach who display the community most popular comics on the first pages (considering how the code was made, this case would be easy to implement).  
  
  
#### Next Features

-	Dividing better the CSS code.
- Deploy.
- Implement more test cases.
- Implement cache on searched characters.
- Some display approach based on comics' popularity.
  
