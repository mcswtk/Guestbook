package com.mcswtk.controller;

import java.util.UUID;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mcswtk.model.Note;
import com.mcswtk.repository.NoteRepository;

@Controller
public class NoteController {

  final private NoteRepository repository;

  @Autowired
  public NoteController(NoteRepository repository) {
    this.repository = repository;
  }
  
  @RequestMapping("/All")
  public ModelAndView showTable() {
    ModelAndView result = new ModelAndView("notesTable");
    try {
      result.addObject("notes", repository.getAll());
    } catch (Exception e) {
      result.addObject("errorMsg", e.getMessage());
    }
    return result;
  }

  @RequestMapping("/All/authors")
  public ModelAndView allAuthors() {
  	ModelAndView result = new ModelAndView("allAuthors");
  	try {
  		result.addObject("notes", repository.getAll());
  		result.addObject("message", "Lista wszystkich autor\u00F3w (Znaleziono "+repository.getAll().size()+" autor\u00F3w.)");
  	} catch (Exception e) {
  		result.addObject("errorMsg", e.getMessage());
  	}
  	return result;
  }
  
  @RequestMapping("/details/{id}")
  public ModelAndView details(@PathVariable("id") String id) {
    ModelAndView result = new ModelAndView("details");
    result.addObject("note", repository.getById(UUID.fromString(id)));
    return result;
  }

  @RequestMapping("/welcome")
  public void welcome() {
  }

  @RequestMapping(value = "/newNote", method = RequestMethod.GET)
  public void newNote() {
  }
  
  @RequestMapping(value = "/newNote", method = RequestMethod.POST)
  public ModelAndView addNote(@ModelAttribute("form") @Valid Note form, BindingResult bindingResult, RedirectAttributes redir) {
    if (bindingResult.hasErrors()) {
      return new ModelAndView("newNote");
    } else {
      try {
        Note newNote = new Note(form.getAuthor(), form.getTitle(), form.getComment(), form.getPassion());
        repository.save(newNote);
        redir.addFlashAttribute("message", "Zapisano!");
      } catch (Exception e) {
        redir.addFlashAttribute("errorMsg", e.getMessage());
      }
      return new ModelAndView("redirect:All");
    }
  }
}
