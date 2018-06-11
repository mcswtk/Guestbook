package com.mcswtk.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.mcswtk.model.Note;

@Repository
public class NoteRepository {
  
  private final JdbcTemplate jdbc;
  private final SimpleJdbcInsert insert;
  
  @Autowired
  public NoteRepository(DataSource dataSource) {
    this.jdbc = new JdbcTemplate(dataSource);
    this.insert = new SimpleJdbcInsert(dataSource)
                        .withTableName("notes")
                        .usingColumns("id", "author", "title", "date", "comment", "passion");
  }
  
  public List<Note> getAll() throws RepositoryException {
    return jdbc.query("SELECT * FROM notes", this::rowToNote);
  }
  
  public Note getById(UUID id) {
    return jdbc.queryForObject("SELECT * FROM notes WHERE id=?", this::rowToNote, id);
  }
  
  public void save(Note newNote) throws RepositoryException {
    Map<String, Object> map = new HashMap<>();
    map.put("id", newNote.getId().toString());
    map.put("author", newNote.getAuthor());
    map.put("date", newNote.getDate());
    map.put("title", newNote.getTitle());
    map.put("comment", newNote.getComment());
    map.put("passion", newNote.getPassion());
    
    insert.execute(map);
  }
  
  private Note rowToNote(ResultSet rs, int row) throws SQLException {
    return new Note(rs.getString("id"), 
    		rs.getString("author"), 
        rs.getString("title"), 
        rs.getDate("date"), 
        rs.getString("comment"),
        rs.getString("passion"));
  }
}
