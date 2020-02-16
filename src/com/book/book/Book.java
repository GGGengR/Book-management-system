package com.book.book;
public class Book {
private String num;//索书号
private int ISBN;
private int bookCount;
private int price;
private String press;
private String author;
private String Bname;
private String Rname;
public String getAuthor() {
	return author;
}
public void setAuthor(String author) {
	this.author = author;
}
public String getNum() {
	return num;
}
public void setNum(String num) {
	this.num = num;
}
public String getPress() {
	return press;
}
public void setPress(String press) {
	this.press = press;
}
public String getBname() {
	return Bname;
}
public void setBname(String bname) {
	Bname = bname;
}
public String getRname() {
	return Rname;
}
public void setRname(String rname) {
	Rname = rname;
}
public int getISBN() {
	return ISBN;
}
public void setISBN(String iSBN) {
	ISBN = Integer.parseInt(iSBN);
}
public int getBookCount() {
	return bookCount;
}
public void setBookCount(String bookCount) {
	this.bookCount =Integer.parseInt( bookCount);
}
public int getPrice() {
	return price;
}
public void setPrice(String price) {
	this.price = Integer.parseInt(price);
}



}
