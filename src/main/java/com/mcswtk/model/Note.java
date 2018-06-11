package com.mcswtk.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class Note {
	
	private UUID id;

	@NotNull
	@Size(min = 3, max = 80, message = "Autor musi zawiera\u0107 {min} - {max} znak\u00F3w.")
	private String author;
	
	@NotNull
	@Size(min = 3, max = 60, message = "Tytu\u0142 musi zawiera\u0107 {min} - {max} znak\u00F3w.")
	private String title;

	private Date date;

	@Size(max=255, message = "Komentarz mo\u017Ce mie\u0107 maksymalnie {max} znak\u00F3w.")
	private String comment;
	
	private String passion;

	public Note() {
	}

	public Note(String author, String title, String comment, String passion) {
		this.id = UUID.randomUUID();
		this.author = author;
		this.title = title;
		this.date = new Date();
		this.passion = passion;
		this.comment = comment;
	}

	public Note(String id, String author, String title, Date date, String comment, String passion) {
		this(author, title, comment, passion);
		this.id = UUID.fromString(id);
		this.date = date;
	}

	public UUID getId() {
		return id;
	}
	
	 public void setId(UUID id) {
	    this.id = id;
	  }

	  public String getTitle() {
	    return title;
	  }

	  public void setTitle(String title) {
	    this.title = title;
	  }

	  public Date getDate() {
	    return date;
	  }
	  
	  public String getAuthor() {
	    return author;
	  }
	  
	  public void setAuthor(String author) {
	    this.author = author;
	  }
	  
	  public String getPassion() {
	    return passion;
	  }
	  
	  public void setPassion(String passion) {
	    this.passion = passion;
	  }
	  
	  public String getDateAsString() {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    String dateString = dateFormat.format(date);
	    return dateString;
	  }
	  
	  public java.sql.Date getDateSQL() {
	    java.sql.Date sqlDate = new java.sql.Date(date.getTime());
	    return sqlDate;
	  }

	  public void setDate(Date date) {
	    this.date = date;
	  }

	  public String getComment() {
	    return comment;
	  }

	  public void setComment(String comment) {
	    this.comment = comment;
	  }

		@Override
		public String toString() {
			return "Note [id=" + id + ", author=" + author + ", title=" + title + ", date=" + date + ", comment=" + comment
			    + ", passion=" + passion + "]";
		}
}
