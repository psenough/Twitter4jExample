
static String OAuthConsumerKey = "";
static String OAuthConsumerSecret = "";
static String AccessToken = "";
static String AccessTokenSecret = "";

Twitter twitter = new TwitterFactory().getInstance();

void connectTwitter() {
  twitter.setOAuthConsumer(OAuthConsumerKey, OAuthConsumerSecret);
  AccessToken accessToken = loadAccessToken();
  twitter.setOAuthAccessToken(accessToken);
}

private static AccessToken loadAccessToken() {
  return new AccessToken(AccessToken, AccessTokenSecret);
}


ArrayList tweetAuthor;
ArrayList tweetText;
ArrayList tweetDate;
ArrayList tweetAuthorGeo;

int numberTweets;


void searchTwitter(String queryStr) {

  tweetAuthor = new ArrayList();
  tweetText = new ArrayList();
  tweetDate = new ArrayList();
  tweetAuthorGeo = new ArrayList();
  numberTweets = 0;
  
 try {
    Query query = new Query(queryStr);    
    query.setRpp(numberTweets); 
    QueryResult result = twitter.search(query);    
    ArrayList tweets = (ArrayList) result.getTweets();   
    numberTweets = tweets.size(); 

    for (int i=0; i<tweets.size(); i++) {	
      Tweet t = (Tweet)tweets.get(i);	
      tweetAuthor.add(t.getFromUser());
      tweetText.add(t.getText());
      Date d = t.getCreatedAt();
      tweetDate.add(d.toString());
      
      /*String date_split[] = (d.toString()).split(" ");

      if (date_split[1].equals("Jan") == true) {
        date_split[1] = "01";
      }
      else if (date_split[1].equals("Feb") == true) {
        date_split[1] = "02";
      }
      else if (date_split[1].equals("Mar") == true) {
        date_split[1] = "03";
      }
      else if (date_split[1].equals("Apr") == true) {
        date_split[1] = "04";
      }
      else if (date_split[1].equals("May") == true) {
        date_split[1] = "05";
      }
      else if (date_split[1].equals("Jun") == true) {
        date_split[1] = "06";
      }
      else if (date_split[1].equals("Jul") == true) {
        date_split[1] = "07";
      }
      else if (date_split[1].equals("Aug") == true) {
        date_split[1] = "08";
      }
      else if (date_split[1].equals("Sep") == true) {
        date_split[1] = "09";
      }
      else if (date_split[1].equals("Oct") == true) {
        date_split[1] = "10";
      }
      else if (date_split[1].equals("Nov") == true) {
        date_split[1] = "11";
      }
      else if (date_split[1].equals("Dec") == true) {
        date_split[1] = "12";
      } 
 
      //String time = date_split[3];

      String time_split[] = date_split[3].split(":");
      //String hours = time_split[0];
      //String mins = time_split[1];
      //String sec = time_split[2];
      
      //         tweetDate = hora + " " + mes + " " + dia + ", " + ano;
      tweetDate.add(new String(time_split[0] + " " + date_split[1] + " " + date_split[2] + ", " + date_split[0]));
*/
      //tweetAuthorGeo.add(t.getPlace());
      
      //list text
      //println((t.getText()).substring(queryStr.length()+1));
     
      //doesnt give anything, freezes
      //println(t.getGeoLocation().toString());
     
      //gives a lot of null's
      //println(t.getLocation());
     
      //doesnt give anything, freezes
      //println((t.getPlace()).getCountry() + " " + (t.getPlace()).getFullName() );
      
      //gives a lot of null's
      //println(t.getPlace());
      
      //returns en pl sv, useless
      //println(t.getIsoLanguageCode());
      
      //println(t.getGeoLocation());
      
      User thisuser = twitter.showUser(t.getFromUser());
      tweetAuthorGeo.add(thisuser.getLocation());      
  }

  } catch (TwitterException e) {    
    println("Search tweets: " + e);  
  }

}
