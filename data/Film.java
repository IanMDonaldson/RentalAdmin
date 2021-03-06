package com.iandonaldson.data;
/* a) list all the stores and their addresses (that’s going to require a Join)
 * b) list the stores and their staff.
 * That’s going to require a Join AND using an inherited class.
 * 1 – List all movies and actors
 * 2 – List all stores and addresses
 * 3 – List all stores and staff.*/
import java.sql.Date;
import java.util.List;

public class Film {
	private Category category;
	private Date releaseYear;
	private Language language;
	private List<Actor> actorList;
	private String description;
	private String rating;
	private String title;
	private double rentalRate;
	private double replacementCost;
	private int id;
	private int languageID;
	private int length;
	private int rentalDuration;
//	private List<String> specialFeatures;

	public Film() {

	}

	public Film(String title,
	             String description,
	             String rating,
			/*List<String> specialFeatures,*/
			     int id,
			     int languageID,
			     int rentalDuration,
			     int length,
			     double rentalRate,
			     double replacementCost,
			     List<Actor> actorList,
			     Date releaseYear
	) {
		this.title = title;
		this.description = description;
		this.rating = rating;
		//this.specialFeatures = specialFeatures;
		this.id = id;
		this.languageID = languageID;
		this.rentalDuration = rentalDuration;
		this.length = length;
		this.rentalRate = rentalRate;
		this.replacementCost = replacementCost;
		this.actorList = actorList;
		this.releaseYear = releaseYear;
	}


	public Film(String title,
				String description,
				String rating,
				/*List<String> specialFeatures,*/
				int id,
				int languageID,
				int rentalDuration,
				int length,
				double rentalRate,
				double replacementCost,
				Date releaseYear
			)
	{
		this.title = title;
		this.description = description;
		this.rating = rating;
		//this.specialFeatures = specialFeatures;
		this.id = id;
		this.languageID = languageID;
		this.rentalDuration = rentalDuration;
		this.length = length;
		this.rentalRate = rentalRate;
		this.replacementCost = replacementCost;
		this.releaseYear = releaseYear;
	}

	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}

	public int getRentalDuration() {
		return rentalDuration;
	}



	public void setRentalDuration(int rentalDuration) {
		this.rentalDuration = rentalDuration;
	}



	public double getRentalRate() {
		return rentalRate;
	}



	public void setRentalRate(double rentalRate) {
		this.rentalRate = rentalRate;
	}



	public int getLength() {
		return length;
	}



	public void setLength(int length) {
		this.length = length;
	}



	public double getReplacementCost() {
		return replacementCost;
	}



	public void setReplacementCost(double replacementCost) {
		this.replacementCost = replacementCost;
	}



	public List<Actor> getActorList() {
		return actorList;
	}



	public void setActorList(List<Actor> actorList) {
		this.actorList = actorList;
	}



	public String getRating() {
		return rating;
	}



	public void setRating(String rating) {
		this.rating = rating;
	}



	public Category getCategory() {
		return category;
	}



	public void setCategory(Category category) {
		this.category = category;
	}



	public Language getLanguage() {
		return language;
	}



	public void setLanguage(Language language) {
		this.language = language;
	}

	/*public List<String> getSpecialFeatures() {
		return specialFeatures;
	}

	public void setSpecialFeatures(List<String> specialFeatures) {
		this.specialFeatures = specialFeatures;
	}
*/
	public int getLanguageID() {
		return languageID;
	}

	public void setLanguageID(int languageID) {
		this.languageID = languageID;
	}

	public Date getReleaseYear() {
		return releaseYear;
	}

	public void setReleaseYear(Date releaseYear) {
		this.releaseYear = releaseYear;
	}
}

