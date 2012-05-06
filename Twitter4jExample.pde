
void setup() {
  connectTwitter();
}

void draw() {
}

void mouseClicked() {
  searchTwitter("word");
  println("got " + numberTweets);
}
