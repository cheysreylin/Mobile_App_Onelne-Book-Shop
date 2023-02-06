
import 'package:flutter/material.dart';

class AuthorOfTheMonth{
  final String image;
  final String name;
  final String background;

 AuthorOfTheMonth(this.image, this.name, this.background);
}

final List<AuthorOfTheMonth> month = [
    new AuthorOfTheMonth(
      "assets/Author/AllAuthor/Chimamanda_Ngozi_Adichie_9374.jpg", 
      "Chimamanda_Ngozi_Adichie", 
      "Chimamanda Ngozi Adichie was born in Nigeria in 1977. She grew up on a college campus, which taught her to love education and writing. After earning a degree from Eastern Connecticut State University in Communication and Political Science, she went on to get a Master’s Degree in creative writing from Johns Hopkins University and a Master of Arts degree from Yale. She has multiple honorary doctorate degrees."
    ),
    new AuthorOfTheMonth(
      "assets/Author/AllAuthor/J.K._Rowling_1999-11-01.jpg", 
      "J. K. Rowling", 
      "J. K. Rowling is the pen name for Joanne Rowling, the British author who is responsible for the Harry Potter series of books. She was born in 1965 and grew up with a love for books, deciding at an early age that she wanted to be a writer. Starting in 1997 with Harry Potter and the Philosopher’s Stone, she wrote seven total novels about the boy wizard, ending with Harry Potter and the Deathly Hollows in 2007."
    ),
    new AuthorOfTheMonth(
      "assets/Author/AllAuthor/Zadie_Smith_NBCC_2011_Shankbone_(cropped).jpg", 
      "Zadie Smith", 
      "Zadie Smith is an English novelist and professor who is a graduate of King’s College and the University of Cambridge. Smith was born in London in 1975, and as a child, she wanted to be a dancer or perform in musical theater until literature became her passion. She has a lengthy list of awards to her name and is an elected fellow of the Royal Society of literature."
    ),
    new AuthorOfTheMonth(
      "assets/Author/AllAuthor/George_Saunders_by_David_Shankbone_(cropped).jpg", 
      "George Saunders", 
      "George Saunders writes just about everything, including children’s books, novels, short stories and essays. Born in 1958 in Texas, he attended the Colorado School of Mines and got a graduate degree from Syracuse University. He teaches creative writing at Syracuse University and is a recipient of the Guggenheim Fellowship and the MacArthur Fellowship."
    ),
    new AuthorOfTheMonth(
      "assets/Author/AllAuthor/Hilary-Mantel.jpg", 
      "Hilary Mantel", 
      "Hilary Mantel was born in England in 1952 and sadly passed away in 2022. She is a British writer known for her personal memoirs, short stories, and historical fiction. She received her education at the University of Sheffield and worked as a social worker at a hospital and a sales assistant in a retail store before realizing writing was her passion."
    ),
    new AuthorOfTheMonth(
      "assets/Author/AllAuthor/Margaret_Atwood_FBM_2019.jpg", 
      "Margaret Atwood", 
      "Canadian writer Margaret Atwood became a household name when her book The Handmaid’s Tale became a major series on Netflix. The story tells of a dystopian society believed to be in what was once America, where fertile women are given as handmaidens to the upper class for the sole purpose of bearing children. Though the book’s original publication was in 1985, it has gained a new following with the television series, prompting the publication of its sequel, The Testaments, in 2019."
    ),
];